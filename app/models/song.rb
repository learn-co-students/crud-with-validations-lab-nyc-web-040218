class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :genre, presence: true
    # validates :released, inclusion: {in: %w(true false), message: false}
    # MY VALIDATOR TO CHECK IF STATEMENT
    # validates_with MyValidator
end
