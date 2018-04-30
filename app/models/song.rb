class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released?

  def released?
    released == true
  end

  def info
    "#{title}, #{artist_name} | #{release_year if released?}"
  end
end
