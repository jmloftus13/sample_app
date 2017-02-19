class Product < ApplicationRecord
	has_many :orders

	def average_rating
	  comments.average(:rating).to_f
	end

end
