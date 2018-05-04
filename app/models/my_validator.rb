class MyValidator < ActiveModel::Validator
  def validate(record)
    
    # IF :RELEASED IS TRUE, :RELEASE_YEAR MUST EXIST.
    # :RELEASE_YEAR CANNOT BE IN THE FUTURE.
    if record[:released] == true
      if !record[:release_year] || record[:release_year] > Time.new.year
        record.errors.add :base, 'This record is invalid'
      end
    end

    # SETUP FOR CHECKING IF ARTIST HAS ALREADY
    # BEEN RELEASED THIS SONG IN THIS YEAR

    if record[:release_year] && record[:title] && record[:artist_name] && Song.last
      arr = [record[:release_year], record[:title], record[:artist_name]]
      arr2 = [Song.last.release_year, Song.last.title, Song.last.artist_name]
      if arr == arr2
        record.errors.add :base, 'This record is invalid'
      end
    end
    
  end
end