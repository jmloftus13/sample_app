class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, presence: true

  def highest_rating_comment
  	comments.rating_desc.first
  end

  def lowest_rating_comment
	comments.rating_asc.first
  end

  def average_rating
	comments.average(:rating).to_f
  end

  def count_ratings
    comments.count(:rating).to_int
  end

  def views
  	#same as 'GET product:1'
  	#successfully implemented Redis in 6.12 but it caused complications on Heroku in 6.13
    #$redis.get("product:#{id}") 
  end

  def viewed!
  	#same as 'INC product:1'
    #$redis.incr("product:#{id}")
  end

end
