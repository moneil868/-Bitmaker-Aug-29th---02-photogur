class Picture < ActiveRecord::Base

  validates :artist, :url, presence: true
  validates :title, length: { maximum: 20,
    too_long: "%{count} characters is the maximum allowed" }
  validates :title, length: { minimum: 3,
    too_short: "%{count} characters is the minimum allowed" }
  validates :url, uniqueness: true

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.pictures_created_in_year(year)
    Picture.where("created_at LIKE ?", year)
  end

end
