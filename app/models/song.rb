class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, if: :already_released
end

def already_released
  released == true
end
