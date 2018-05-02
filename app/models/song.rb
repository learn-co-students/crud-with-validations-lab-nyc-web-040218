class Song < ActiveRecord::Base

  #uniqueness?
  validates :title, presence:true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "Song already exists"  }
  validates :released, {inclusion:[false, true]}
  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, {numericality: {only_integer: true, less_than_or_equal_to: Date.today.year}}
  end
  validates :artist_name, {presence:true}

end
