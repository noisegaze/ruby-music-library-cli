module Concerns::Findable 
    module Classmethods 

       def find_by_name 
        self.class.all.find do |item|
            item.name == name
        end
       end


    end






end
