class Review < ApplicationRecord
  belongs_to :user
  belongs_to :school
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true
  has_many :review_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

end
