class Role < ApplicationRecord
		enum name: {guest: 0, contactperson: 1, contractor: 3, contractorplus: 5, planner: 6, associate: 7, administrator: 8, superuser: 9}
end
