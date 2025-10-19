class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200 }
  validates :synopsis, presence: true
  validates :year, presence: true,
            numericality: { only_integer: true,
                            greater_than: 1800,
                            less_than_or_equal_to: -> { Date.current.year + 5 } }
  validates :duration, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :director, presence: true, length: { maximum: 100 }

  scope :recent_first, -> { order(created_at: :desc) }

  paginates_per 6
end
