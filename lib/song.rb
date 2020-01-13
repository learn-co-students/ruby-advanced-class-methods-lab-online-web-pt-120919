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
    @@all << song
    song 
  end 
  def self.new_by_name(new_string_with_name)
    song = self.new
    song.name = new_string_with_name
    song.save
    song
  end 
  def self.create_by_name(with_name)
    song=self.new
    song.name = with_name
    song.save
    song 
  end 
  def self.find_by_name(string_with_name)
  self.all.find {|a| a.name == string_with_name}
  end 
  def self.find_or_create_by_name (name)
     self.find_by_name(name) || self.create_by_name(name)
    end 
  end 
  def self.alphabetical(name)
    @@all.sort_by{|a| a.name}
  end 
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split("-")[1].chomp("mp3"))
    song.artist_name = (name.split("-")[0])
    song 
  end   
    def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split("-")[1].chomp("mp3"))
    song.artist_name = (name.split("-")[0])
    @@all << self 
    song 
    end
    
  def self.destroy_all(name)
    @@all.clear
  end 
end
