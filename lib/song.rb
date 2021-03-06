require 'pry'

class Song 

    extend Concerns::Findable

    attr_accessor :name, :genre 
    attr_reader :artist

    @@all = []

    def initialize(name,artist=nil,genre=nil) 
        @name = name
        self.artist = artist if artist 
        self.genre = genre if genre 
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
        song = Song.new(name) 
        song.save
        song 
    end 

    def artist=(artist)
        if @artist == nil 
            @artist = artist 
        else @artist != nil 
            @artist = artist
        end
        if self.artist != nil 
            @artist.add_song(self)
        end 
        @artist
    end

    def self.find_by_name(name) 
        #binding.pry
       @@all.find do |song|
            song.name == name
        end
    end 

    def self.find_or_create_by_name(name) 
        self.find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(file_name)
        title = file_name.split(" "||" - ")
        person = title[0]
        title2 = title[2..5].join(", ").gsub(/,/,"")  
        artist_object = Artist.find_or_create_by_name(person)
        song_object = Song.find_or_create_by_name(title2)
        
        
    end











end