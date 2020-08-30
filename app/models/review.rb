class Review < ApplicationRecord
  acts_as_taggable
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

  def create_notification_like!(current_user)
    temp = notification.where(["visitor_id = ? and visited_id = ? and review_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    if temp.blank?
      notifiation = current_user.active_notifications.new(
        review_id: id,
        visited_id: user_id,
        action: 'like'
      )
      if notification.visitor_id == notifications.visited_id
        notification.checked = true
      end
        notification.save if notification.valid?
    end

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(review_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      review_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
