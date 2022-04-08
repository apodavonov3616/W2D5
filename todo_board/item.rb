require "byebug"

class Item
    def self.valid_date?(date_string)
        if !date_string.is_a?(String)
            return false
        end

        individual_numbers = date_string.split('-')

        return false if individual_numbers.length != 3
        return false if individual_numbers[0].length != 4
        return false if individual_numbers[1].length != 2
        return false if individual_numbers[2].length != 2

        return false if !individual_numbers[0].to_i.is_a?(Integer) || individual_numbers[0].to_i > 2022 || individual_numbers[0].to_i < 1
        return false if !individual_numbers[1].to_i.is_a?(Integer) || individual_numbers[1].to_i > 12 || individual_numbers[1].to_i < 1
        return false if !individual_numbers[2].to_i.is_a?(Integer) || individual_numbers[2].to_i > 31 || individual_numbers[2].to_i < 1

        true
    end

    def initialize(title, deadline, description)
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise 'not a valid date'
        end
        @title = title
        @description = description
    end

    attr_accessor :title, :deadline, :description

end
