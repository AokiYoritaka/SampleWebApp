class School < ApplicationRecord
  has_many :review, dependent: :destroy
  scope :sorted, -> { order(created_at: :desc) }
  validates :name, presence: true

  scope :search, -> (search_params) do
    return if search_params.blank?
    name_like(search_params[:name]).prefecture_is(search_params[:prefecture]).genre_is(search_params[:genre])
  end

end
