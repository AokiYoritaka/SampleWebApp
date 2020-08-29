class School < ApplicationRecord
  has_many :review, dependent: :destroy
end
