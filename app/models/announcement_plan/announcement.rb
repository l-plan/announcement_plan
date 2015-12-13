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


    scope :unread, -> (user){ where(id: ( where(nil) - joins(:recipients).where("announcement_plan_recipients.user_id= ?",user.id) ).map(&:id).uniq  )}
    scope :read, -> (user){ joins(:recipients).where("announcement_plan_recipients.user_id= ?",user.id) }
   

    scope :current, -> (time = Time.now ) { where("start_announcing_at < :time AND stop_announcing_at > :time", time: time ) }


    def category_color
      category.color
    end

    def category_name
      category.name
    end

    def root_tenant_ids=(arr)
      tenants.each{|x| x.destroy}
      arr.each{|x| tenants.build(tenant_id: x)}
    end
  
    def root_tenant_ids
      tenants.map(&:tenant_id)
    end

    def root_user_ids=(arr)
      addressees.each{|x| x.destroy}
      arr.each{|x| addressees.build(user_id: x)}
    end
  
    def root_user_ids
      addressees.map(&:user_id)
    end    
    def root_role_namen=(arr)
      roles.each{|x| x.destroy}
       arr.each{|x| roles.build(name: x)}
    end

    def root_role_namen
      roles.map(&:name)
    end

    def self.for_user(user,time=nil)
      time ||=Time.now
      rel = []
      rel += as_tenant(user).map(&:id) if AnnouncementPlan.configuration.with_tenant
      rel += as_role(user).map(&:id) if AnnouncementPlan.configuration.with_role
      rel += as_addressee(user).map(&:id)
      rel = (rel.uniq)
 
      rel -= read(user).map(&:id) 

      where(id: rel).current(time)

    end

  end
end
