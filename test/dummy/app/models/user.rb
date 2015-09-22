class User < ActiveRecord::Base
	belongs_to :tenant
	has_one :role
end
