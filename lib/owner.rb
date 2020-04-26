require "pry"
class Owner
  attr_reader :name, :species
  attr_accessor 

  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def species
      @species
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.size
  end
  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|c| c.owner == self}
  end

  def dogs
    Dog.all.select {|c| c.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|d| d.mood= "happy"}
  end

  def feed_cats
    self.cats.each {|c| c.mood="happy"}
  end
  
  def sell_pets
    self.dogs.each {|d| d.mood = "nervous"}
    self.cats.each {|c| c.mood= "nervous"}
    self.dogs.each {|d| d.owner = nil}
    self.cats.each {|c| c.owner = nil}
  end
  
  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end
end