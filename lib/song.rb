require 'pry'
class Song
  attr_accessor :name, :artist_name,:create
  @@all = []
  
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
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
    @@all.detect { |i| i.name == song_name}
    end
    
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    binding.pry
  end
    
  def self.alphabetical
    @@all.sort { |a,b| a.name <=> b.name}
    
    end
    
  def self.new_from_filename(file)
    @song 
    end
    
  def self.create_from_file_name
    end
    
  def self.destroy_all
    end 
  
end