require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    # @@all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    song = self.new
    song.name = split_filename[1].split(".mp3")[0]
    song.artist_name = split_filename[0]
    song
  end


def self.create_from_filename(filename)
  split_filename = filename.split(" - ")
  song = self.new
  song.name = split_filename[1].split(".mp3")[0]
  song.artist_name = split_filename[0]
  song.save
  song
end


def self.destroy_all
  self.all.clear
end

  # def read_me
  #   @name  #here i can call on just the instance variable because when the instnace method
  #   #readme is invoked, it will search the @name of the instance given
  # end
  # song.read_me

# class is blueprint, or mom
#   instance is an object based on blueprint, or baby

# @name can also be accessed by .name
# instance variable
# .name is invoking the method created by attr_accessor
#
# setter
# def name=(name)
#   @name = name
# end
#
# getter
# def name
#   @name
# end



end
