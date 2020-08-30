class Category < ApplicationRecord
  has_many :reviews, through: :review_category_relations
end
