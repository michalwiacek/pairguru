class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :text, presence: true

  def self.last_week_comments
    Comment.where("created_at >= ?", 1.week.ago.utc).order("created_at")
  end
end
