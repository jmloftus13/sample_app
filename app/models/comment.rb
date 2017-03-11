class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  validates :body, presence: true
  	validates :user, presence: true
  	validates :product, presence: true
  	validates :rating, numericality: { only_integer: true }

  	#calls app/jobs/comment_update_job.rb
  	after_create_commit { CommentUpdateJob.perform_later(self, @user) }

end #end Comment class
