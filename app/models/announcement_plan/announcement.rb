module AnnouncementPlan
  class Announcement < ActiveRecord::Base
  	has_many :addressees
  	has_many :recipiants
  	has_many :roles
  	has_many :tenants

  	belongs_to :category

  	scope :addressee, -> (user) { joins(:addressees).where("announcement_plan_addressees.user_id = ?", user.id) }
  	scope :role, -> (user) { joins(:roles).where("announcement_plan_roles.name = ?", user.role.naam) }
  	scope :tenant, -> (user) { joins(:tenants).where("announcement_plan_tenants.tenant_id = ?", user.tenant.id) }
  	scope :recipient, -> (user) { joins(:recipiants).where("announcement_plan_recipiants.user_id = ?", user.id) }

  end
end
