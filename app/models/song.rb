class Song < ActiveRecord::Base
  #Title cannot be blank
  validates(:title, {presence: true})

  #Song title cannot be used by the same artist in the same year
  validates(:title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  })

  #Artist Name cannot be blank
  validates(:artist_name, {presence: true})
  #Field can be only true or false
  validates(:released, {inclusion: [true, false]})

  #release_year field is optional if released is false
  with_options if: :released? do |song|
    validates(:release_year, {presence: true})
    validates(:release_year, {numericality: {less_than_or_equal_to: Date.current.year}})
  end

  def released?
    released
  end
end
