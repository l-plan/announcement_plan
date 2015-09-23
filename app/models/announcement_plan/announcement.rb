module AnnouncementPlan
  class Announcement < ActiveRecord::Base
  	has_many :addressees
  	has_many :recipients
  	has_many :roles
  	has_many :tenants

  	belongs_to :category


    scope :as_tenant, -> (user) {joins(:tenants).where("announcement_plan_tenants.tenant_id = ?", user.tenant.id ) }
    scope :as_role, -> (user) {joins(:roles).where("announcement_plan_roles.name = ?", user.role.naam ) }
    scope :as_addressee, -> (user) {joins(:addressees).where("announcement_plan_addressees.user_id = ?", user.id ) }

    scope :unread, -> (user){joins(:recipients).where.not("announcement_plan_recipients.user_id = ?", user.id )}

    scope :current, -> (time = Time.now ) { where("start_announcing_at < :start AND stop_announcing_at > :stop", start: time, stop: time ) }


    scope :for_user, -> (user) { where(nil)}

    def self.for_user(user)

      rel = current.unread(user)
      rel = rel.as_tenant(user) if AnnouncementPlan.configuration.with_tenant
      rel = rel.as_role(user) if AnnouncementPlan.configuration.with_role
      rel = rel.as_addressee(user)
      rel

    end

  end
end
