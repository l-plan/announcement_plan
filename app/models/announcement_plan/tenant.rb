module AnnouncementPlan
  class Tenant < ActiveRecord::Base
  	belongs_to :announcement


  	def tenant
  		::Tenant.find tenant_id
  	end
  end
end
