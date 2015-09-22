module AnnouncementPlan
  class Announcement < ActiveRecord::Base
  	has_many :users
  	has_many :readers
  	has_many :roles
  	has_many :tenants

  	belongs_to :category

  	scope :user, -> (user) { joins(:users).where("announcement_plan_users.user_id = ?", user.id) }
  	scope :role, -> (user) { joins(:roles).where("announcement_plan_roles.name = ?", user.role.naam) }
  	scope :tenant, -> (user) { joins(:tenants).where("announcement_plan_tenants.tenant_id = ?", user.tenant.id) }
  	scope :reader, -> (user) { joins(:users).where("announcement_plan_users.user_id = ?", user.id) }

  end
end
