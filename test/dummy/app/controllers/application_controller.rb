class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_for_announcements, only: [:new, :show, :edit, :index]
  before_action :check_for_recipients, only: [:new, :show, :edit, :index]

  def check_for_announcements
  	@current_announcement = current_user.announcements.first
  end

  def check_for_recipients
  	@current_recipient = current_user.recipients.unread.first
  end


  def current_user
  	@current_user = User.includes(:announcements).find(1)
  end
end
