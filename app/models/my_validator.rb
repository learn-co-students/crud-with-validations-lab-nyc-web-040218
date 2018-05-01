class MyValidator < ActiveModel::Validator
    def validate(record)
      if :released == nil
        
      end
        unless !record.title.blank? && str.any? {|word| record.title.include?(word)}
          record.errors[:name] << false
        end
      end
end