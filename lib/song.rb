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

def self.new_by_name(name)
  song = self.new
  song.name = name
  song
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  song
end

def self.find_by_name(name)
  @@all.find{|x| x.name == name}
end


def self.find_or_create_by_name(name)
   if self.find_by_name(name)
     self.find_by_name(name)
    else
      self.create_by_name(name)
  end
end

 def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  def self.new_from_filename(string)
    new_array = string.split("- ")
    song_name = "#{new_array[1]}".gsub(".mp3",'')
    song = self.new 
    song.name = "#{song_name}"
    song.artist_name = "#{new_array[0]}".gsub(" ",'')
    song
  end

  def self.create_from_filename(string)
    new_array = string.split("- ")
    song_name = "#{new_array[1]}".gsub(".mp3",'')
    song = self.new 
    song.name = "#{song_name}"
    song.artist_name = "#{new_array[0]}".gsub(" ",'')
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end