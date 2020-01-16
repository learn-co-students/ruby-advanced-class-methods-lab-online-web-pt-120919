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
    song = self.new #instantiates
    song.save # calles the .save method and saves it
    song # returns it
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new # instantiates
    song.name = name # makes song.name equal to the name and gets it
    song.save # saves the name
    song # returns the name
  end
  
  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end
  
  def self.find_or_create_by_name(name) 
    self.find_by_name(name) || self.create_by_name(name)# find by name or if you can't find it create by the name
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end
  
  def self.new_from_filename(filename)
    song = self.new
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.create
    split_filename = filename.chomp(".mp3").split(" - ")
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end
    
  
  
  def self.destroy_all
    self.all.clear
  end
end

song = Song.new_from_filename("Thundercat - For Love I Come.mp3")

song
