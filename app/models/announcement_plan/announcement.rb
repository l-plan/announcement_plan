module AnnouncementPlan
  class Announcement < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_and_belongs_to_many :tenants
    has_and_belongs_to_many :role_sources

    has_many :roles, through: :role_sources

  	has_many :recipients
  	belongs_to :category

    scope :as_tenant, -> (user) {joins(:tenants).where('tenants.id = ?', user.tenant_id) }
    scope :as_role, -> (user) {joins(:roles).where('roles.role_source_id in (?)' ,user.roles.map(&:id)) }
    scope :as_user, -> (user) {joins(:users).where('users.id = ?' ,user.id)  }


    scope :read, -> (user){ joins(:recipients).where("announcement_plan_recipients.user_id= ?",user.id) }
   

    scope :current, -> (time = Time.now ) { where("start_announcing_at < :time AND stop_announcing_at > :time", time: time ) }


    def category_color
      category.color
    end

    def category_name
      category.name
    end


    def self.for_user(user,time=nil)
      time ||=Time.now
      rel = []
      rel += as_tenant(user).map(&:id) if AnnouncementPlan.configuration.with_tenant
      rel += as_role(user).map(&:id)  if AnnouncementPlan.configuration.with_role
      rel += as_user(user).map(&:id)
      rel = (rel.uniq)
 
      rel -= read(user).map(&:id)

      where(id: rel).current(time)

    end

  end
end
