class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :artist_name, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_optional
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }


  def release_year_optional
    if released == true && !:release_year.present?
      errors.add(:release_year, "Must enter a release year.")
    end
  end

end
