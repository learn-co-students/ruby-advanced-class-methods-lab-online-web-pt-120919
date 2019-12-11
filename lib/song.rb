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
    song = self.new 
    song.save 
    song 
  end
  
  def self.new_by_name(song_name)
    song = Song.new
    song.name= song_name
    song 
  end
  
  def self.create_by_name(song_name)
    song = Song.new_by_name(song_name)
    song.save 
    song 
  end
  
  def self.find_by_name(song_name)
    found = @@all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if !song 
      song = self.create_by_name(song_name)
    end
    song 
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name }
  end
  
  def self.new_from_filename(file_name)
    parts = file_name.split(".")
    data = parts[0].split(" - ")
    song = self.new_by_name(data[1])
    song.artist_name = data[0]
    song 
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save 
  end
  
  def self.destroy_all 
    @@all.clear
  end
end
