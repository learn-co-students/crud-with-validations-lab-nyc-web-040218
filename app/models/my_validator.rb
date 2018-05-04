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

    arr = [record[:release_year], record[:title], record[:artist_name]]
    results = []
    results << Song.all.select do |song|
      if [song.release_year, song.title, song.artist_name] == arr
        true
      else
        false
      end
    end.flatten!

    if results.include?(true)
      record.errors.add :base, 'This record is invalid'
    elsif results.empty? || results[0] == nil
    else
    end


    
    # unless !record.title.blank? && str.any? {|word| record.title.include?(word)}
    #   record.errors[:name] << false
    # end
  end
end