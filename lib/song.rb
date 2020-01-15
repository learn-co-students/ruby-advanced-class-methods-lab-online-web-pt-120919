require 'pry'
class Song
  attr_accessor :name, :artist_name,:create
  @@all = []
  
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
    #binding.pry
  end
  

  def self.create
    @song = self.new 
    @song.save
    @song
  end
  
  def self.new_by_name(band_name)
    @song = self.new 
    @song.name = band_name
    @song
  end
    
  def self.create_by_name(song_name)
    @song = self.new
    @song.name = song_name
    @song.save 
    @song
    end
    
  def self.find_by_name(song_name)
    @@all.find { |i| i.name == song_name}
    #binding.pry
    end
    
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
    #binding.pry

    @@all.detect { |i| i.name == song_name}
    end
    
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #binding.pry
  end
    
  def self.alphabetical
    @@all.sort_by { |i| i.name}
    
    end
    
  def self.new_from_filename(filename)
    song_arr = filename.split(" - ")
    song_arr[1] = song_arr[1].chomp(".mp3")
    song = self.new
    song.name = song_arr[1]
    song.artist_name = song_arr[0]
    song 
  
    end
    
  def self.create_from_filename(name)
    song_arr = name.split(" - ")
    song_arr[1] = song_arr[1].chomp(".mp3")
    song = self.new
    song.name = song_arr[1]
    song.artist_name = song_arr[0]
    song.save 
    song 
   
    end
    
  def self.destroy_all
    self.all.clear
end
end