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
    self.all << song
    song
  end
  
  def self.new_by_name (title)
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name (title)
    song = self.new
    song.name = title
    @@all << song
    song
  end
  
  def self.find_by_name (title)
    @@all.find {|song| song.name == title}
  end
  
  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename (title)
    splitted = title.split(" - ")
    artist_name = splitted[0]
    name = splitted[1].delete_suffix(".mp3")
    
    filename = self.new
    filename.name = name
    filename.artist_name = artist_name
    filename
  end
  
  def self.create_from_filename (title)
    splitted = title.split(" - ")
    artist_name = splitted[0]
    name = splitted[1].delete_suffix(".mp3")
    
    filename = self.new
    filename.name = name
    filename.artist_name = artist_name
    filename
    @@all << filename
  end
  
  def self.destroy_all
    @@all.clear
  end

end
