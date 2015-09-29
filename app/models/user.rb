class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :profile_photo, ProfilePhotoUploader

  has_many :reviews, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :programs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def vote_load_state(review_instance)
     @vote = Vote.where(user: self).where(review: review_instance)
     if @vote.class == Vote
       @current_state = @vote[0].vote_state
     else
       @current_state = { up: "upvote", down: "downvote" }
     end
   end
end
