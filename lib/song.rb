class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new_song = Song.new()
    Song.all << new_song
    new_song
  end
  
  def self.new_by_name(name)
    new_song = Song.create
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = Song.create
    new_song.name = name 
    new_song.save
    new_song
  end
  
  def self.find_by_name(name) 
    self.all.find{ |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else 
      Song.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.uniq.sort_by { |song_name| song_name.name }
  end
  
  def self.new_from_filename(filename)
    new_song = Song.create
    new_song.name = filename.split(" - ")[1].chomp(".mp3")
    new_song.artist_name = filename.split(" - ")[0]
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = Song.create 
    new_song.name = filename.split(" - ")[1].chomp(".mp3")
    new_song.artist_name = filename.split(" - ")[0]
    new_song.save 
    new_song
  end
  
  def self.destroy_all 
    self.all.clear
  end


end
