class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :genre, presence: true
    validates :released, inclusion: { in: [true, false] }

    if validates :released, inclusion: { in: [true] }
        validates :release_year, presence: true
    end
    # MY VALIDATOR TO CHECK IF STATEMENT
    # validates_with MyValidator
end
