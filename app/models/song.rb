class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year, message: "cannot have the same title in the same year"}
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, allow_blank: true, if: :not_released
  validates :release_year, presence: true, if: :yes_released
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year}, if: :yes_released
  validates :artist_name, presence: true

  def not_released
    released == false
  end

  def yes_released
    released == true
  end
end
