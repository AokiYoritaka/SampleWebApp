class School < ApplicationRecord
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true
  validates :address, presence: :true
  validates :res_id, uniqueness: true

  scope :sorted, -> { order(created_at: :desc) }
  scope :search, -> (search_params) do
    return if search_params.blank?
    name_like(search_params[:name]).prefecture_is(search_params[:prefecture]).genre_is(search_params[:genre])
  end

  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :prefecture_is, -> (prefecture) { where('prefecture LIKE ?', "%#{prefecture}%") if prefecture.present? }
  scope :genre_is, -> (genre) { where('genre LiKE ? OR subgenre LIKE ?', "%#{genre}%", "%#{genre}%") if genre.present? }
end
