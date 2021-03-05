require 'pry'

class Genre 

    extend Concerns::Findable::Classmethods

    attr_accessor :name 

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
        genre = Genre.new(name) 
        genre.save 
        genre 
    end

    def songs 
        Song.all {|song| song.genre == self.name }
    end

    def artists 
        artists = songs.collect do |song| 
            song.artist
        end
        artists.uniq 
    end









end