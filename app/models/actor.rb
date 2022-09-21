class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters



    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        output = []
        characters.map do |character|
            showid = character.show_id
            output << "#{character.name} - #{shows.find(showid).name}"
        end
        output
    end


    # solution version:
    # def list_roles
    #     self.characters.map do |character|
    #       "#{character.name} - #{character.show.name}"
    #     end
    # end

    #because map already returns an array



end