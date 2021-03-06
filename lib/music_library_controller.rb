require 'pry' 

class MusicImporter 

    attr_accessor :path

    def initialize(path="./db/mp3s/")
        @path = path 
    end  

    def files()
        @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    end

    

end