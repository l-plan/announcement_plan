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

    # scope :unread, -> (user){where(nil).joins(:recipients).where.not("announcement_plan_recipients.user_id = ?", user.id )}
    # scope :unread, -> (user){where(nil).includes(:recipients)}
       # scope :unread, -> (user){where(nil).joins(:recipients).where( "announcement_plan_recipients.id = ?", nil) }
    # Friend.includes(:contacts).where( :contacts => { :id => nil } )
    # scope :without_photos, joins('LEFT OUTER JOIN photos ON cities.id = photos.city_id').group('cities.id').having('count(photos.id) = 0')
    # scope :unread, joins('LEFT OUTER JOIN photos ON cities.id = photos.city_id').group('cities.id').having('count(photos.id) = 0')


    # City.includes(:photos).where.not( photos: {city_id: nil} )
    # includes(:recipients).where.not( recipients: {announcement_id: nil} )
    # scope :unread, -> (user){includes(:recipients).where.not( "announcement_plan_recipients.announcement_id = ?", nil) }
        # includes(:recipients).where.not( recipients: {announcement_id: nil} )
    # scope :unread, -> (user){includes(:recipients).where.not( recipients: {id: nil}).references(:recipients) }

    scope :unread, -> (user){ where(id: ( where(nil) - joins(:recipients).where("announcement_plan_recipients.user_id= ?",user.id) ).map(&:id).uniq  )}
    scope :read, -> (user){ joins(:recipients).where("announcement_plan_recipients.user_id= ?",user.id) }
    # AnnouncementPlan::Announcement.joins(:recipients).where("announcement_plan_recipients.user_id= ?",2).size

    scope :current, -> (time = Time.now ) { where("start_announcing_at < :time AND stop_announcing_at > :time", time: time ) }


  

    def self.for_user(user,time)
      time =Time.now
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
