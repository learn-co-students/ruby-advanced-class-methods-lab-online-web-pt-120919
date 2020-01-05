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
    new_song = self.new 
    self.all << new_song 
    new_song
  end
   
  def self.new_by_name(name) 
    new_song = self.new 
    new_song.name = name 
    new_song
  end 
  
  def self.create_by_name(name) 
    new_song = self.new 
    new_song.name = name 
    self.all << new_song 
    new_song
  end 
  
  def self.find_by_name(name) 
    self.all.find{|person| person.name == name }
  end 
  
  def self.find_or_create_by_name(name) 
      self.find_by_name(name) 
      if !self.all.include?(name)
        self.create_by_name(name) 
        self.find_by_name(name)
      end
  end 
  
  def self.alphabetical 
    self.all.sort_by { |song| song.name }
  end 
  
  def self.new_from_filename(file_name)
    new_string = file_name.split(" - ") 
    song_artist = new_string[0]
    puts song_artist
    song_name_parse = new_string[1].split(".") 
    song_name = song_name_parse[0] 
    puts song_name
    new_song = self.new 
    new_song.name = song_name 
    new_song.artist_name = song_artist
    new_song
  end 
  
  def self.create_from_filename(file_name) 
    new_string = file_name.split(" - ") 
    song_artist = new_string[0]
    puts song_artist
    song_name_parse = new_string[1].split(".") 
    song_name = song_name_parse[0] 
    puts song_name
    new_song = self.new 
    new_song.name = song_name 
    new_song.artist_name = song_artist
    self.all << new_song 
    new_song
  end
  
  def self.destroy_all 
    @@all.clear
  end
end

song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
