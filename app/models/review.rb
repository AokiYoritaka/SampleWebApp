class Review < ApplicationRecord
  act_as_taggable
  belongs_to :user
  belongs_to :school
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true
  has_many :review_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy


  def like_rev(user)
    likes.create(user_id: user.id)
  end

  def un_like_rev(user)
    likes.find_by(user_id: user.id).destroy
  end

  def like_rev?(user)
    like_rev_users.include?(user)
  end

  def self.search(search)
    if search
      Review.where(['body LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Review.all
    end
  end

  
end
