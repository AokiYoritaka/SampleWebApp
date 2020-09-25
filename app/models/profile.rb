class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  mount_uploader :avatar, AvatarUploader
end