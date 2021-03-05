require 'pry' 

class Artist 

    extend Concerns::Findable

    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
    end 

    def self.all
        @@all 
    end 

    def self.destroy_all 
        @@all.clear 
    end 

    def save 
        @@all << self 
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save 
        artist 
    end  

    def songs 
        Song.all {|song| song.artist == self.name}
    end 

    def add_song(song)
       song.artist = self unless song.artist == self 
       self.songs << song unless song.artist == self 
    end     

    def genres 
       genres = songs.collect do |song| 
           song.genre 
        end 
        genres.uniq
    end



end