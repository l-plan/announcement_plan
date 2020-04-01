module AnnouncementPlan
  class Announcement < ActiveRecord::Base
    has_and_belongs_to_many :recipients

  	belongs_to :category

 


    scope :read, -> (user){ joins(:recipients).where("announcement_plan_recipients.user_id= ?",user.id) }
   

    scope :current, -> (time = Time.now ) { where("start_announcing_at < :time AND stop_announcing_at > :time", time: time ) }


    def category_color
      category.color
    end

    def category_name
      category.name
    end


  end
end
