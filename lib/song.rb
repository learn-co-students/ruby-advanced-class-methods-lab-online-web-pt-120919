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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if !song
      song = create_by_name(name)
    end
    song
  end
  
  def self.alphabetical
    @@all.sort_by do 
      |song| song.name
    end
  end
  
  def self.new_from_filename(filename)
    song_arr = filename.split(' - ')
    song_arr[1] = song_arr[1].slice(0..-5)
    song = new_by_name(song_arr[1])
    song.artist_name = song_arr[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end
  
  def self.destroy_all
    @@all = []
  end
end
