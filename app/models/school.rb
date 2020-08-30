class School < ApplicationRecord
  has_many :review, dependent: :destroy
  scope :sorted, -> { order(created_at: :desc) }
  validates :name, presence: true
  
end
