class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.create
    song_instance = self.new
    song_instance.save
    song_instance
  end
  
  def self.new_by_name(name)
    song_instance = self.new
    song_instance.name = name
    song_instance
  end
  
  def self.create_by_name(name)
    song_instance = new_by_name(name)
    song_instance.save
    song_instance
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def save
    self.class.all << self
  end
  
  def self.find_or_create_by_name(name)
    song = find_by_name(name) 
    if song != nil
      return song
    else
      return create_by_name(name)
    end
  end
  
  def self.alphabetical
    all.sort{|song_a,song_b| song_a.name <=> song_b.name}
  end
  
  def self.new_from_filename(filename)
    temp = filename.split(" - ")
    artist = temp[0]
    song_name = temp[1].split(".")[0]
    song_instance = self.new
    song_instance.name = song_name
    song_instance.artist_name = artist
    song_instance
  end
  
  def self.create_from_filename(file_name)
    song_instance = new_from_filename(file_name)
    song_instance.save
  end
  
  def self.destroy_all
    @@all.clear
  end
end
