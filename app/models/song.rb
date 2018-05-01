class Song < ActiveRecord::Base
  validates :title, presence: true
  # validates :title, uniqueness: true
  validates :released, inclusion: { in: %w(true false),
    message: "%{value} is not a valid entry" }
  # validates :release_year, length: { minimum: 2 }
  # validates :release_year, presence: true, :if => :released==true
  validates :artist_name, presence: true
end
