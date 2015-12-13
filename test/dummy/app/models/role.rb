class Role < ActiveRecord::Base
	belongs_to :user

	def self.namen
		{"superuser"=>0,
 "admin"=>1,
 "gebruiker"=>2,
 "gast"=>3,
 "medewerker"=>4,
 "manager"=>5,
 "accountant"=>6}
	end
end
