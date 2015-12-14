class User < ActiveRecord::Base
	belongs_to :tenant
	has_many :roles


	# def role
	# 	roles.first
	# end
end
