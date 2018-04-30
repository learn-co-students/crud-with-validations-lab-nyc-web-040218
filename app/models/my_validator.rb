class MyValidator < ActiveModel::Validator
    def validate(record)
        unless !record.title.blank? && str.any? {|word| record.title.include?(word)}
          record.errors[:name] << false
        end
      end
end