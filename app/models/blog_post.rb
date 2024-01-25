class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def isDraft?
    published_at.nil?
  end

  def isPublished?
    published_at? && published_at <= Time.current
  end

  def isScheduled?
    published_at? && published_at > Time.current
  end
end
