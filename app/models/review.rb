class Review < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true
  belongs_to :school
end
