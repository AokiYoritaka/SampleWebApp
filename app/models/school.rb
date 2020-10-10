class School < ApplicationRecord
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :address, presence: :true
  validates :res_id, uniqueness: true
  validates :name, presence: true
  scope :sorted, -> { order(created_at: :desc) }

  scope :search, -> (search_params) do
    return if search_params.blank?
    name_like(search_params[:name]).nation_is(search_params[:nation]).genre_is(search_params[:genre])
  end


  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :nation_is, -> (nation) { where('nation LIKE ?', "%#{nation}%") if nation.present? }
  scope :genre_is, -> (genre) { where('genre LiKE ? OR subgenre LIKE ?', "%#{genre}%", "%#{genre}%") if genre.present? }
end
