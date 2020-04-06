module AnnouncementPlan
  class Announcement < ActiveRecord::Base
    has_many :recipients, dependent: :destroy
    # has_many :users, through: :recipients

  	belongs_to :category

    validates :start_announcing_at, presence: true
    validates :stop_announcing_at, presence: true

 
    before_save :create_recipients

    # scope :unread, -> (user){ joins(:recipients).where("announcement_plan_recipients.user_id= ?",user.id) }
   

    # scope :current, -> (time = Time.now ) { where("start_announcing_at < :time AND stop_announcing_at > :time", time: time ) }
    def users_ids
    end

    def create_recipients

      ::User.all.each do |user|
        next if recipients.find{|x| x.user_id == user.id}
        recipients.build(user_id: user.id)
      end
    
    end


  end
end
