class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user, optional: true

  validates :content, presence: true, length: { minimum: 3, maximum: 1000 }
  validates :commenter_name, presence: true, length: { maximum: 100 }

  scope :recent_first, -> { order(created_at: :desc) }

  before_validation :set_commenter_name

  private

  def set_commenter_name
    self.commenter_name = user.email.split('@').first if user.present? && commenter_name.blank?
  end
end
