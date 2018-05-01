class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :validateSong
  validates :released, inclusion: {in: [true, false]}
  validate :released?
  validates :artist_name, presence: true

  private

  validate

  def released?
    if self.released
      unless self.release_year != nil && self.release_year <= Time.new.year
        self.errors[:base] << "Invalid year"
      end
    end
  end

  def validateSong
    Song.all.each do |song|
      if song.title == self.title && song.artist_name == self.artist_name && song.release_year == self.release_year
        self.errors[:base] << "Song already exists"
      end
    end
  end


end
