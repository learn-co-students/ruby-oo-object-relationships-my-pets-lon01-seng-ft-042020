require 'pry'
class Owner
    
      attr_reader :name, :species

      @@all = []

    def initialize(name)
        @name = name
        @species = "human"
        @@all << self
    end  

    def say_species
        "I am a human."
    end

    def self.all
        @@all
    end

    def self.count
        @@all.size
    end

    def self.reset_all
        @@all = []
    end

    def cats
        Cat.all.select do |cat|
        cat.owner == self
        end
    end  

    def dogs
        Dog.all.select do |dog|
        dog.owner == self
        end
    end

    def buy_cat(cat_name)
        # Cat.all.find do |cat| cat.name == cat_name
        #     binding.pry

        #     end
        Cat.new(cat_name, self)    
    end

    def buy_dog(dog_name)
        Dog.new(dog_name, self)
    end

    def walk_dogs
        Dog.all.map {|dog| dog.mood = "happy"}
    end

    def feed_cats
        Cat.all.map {|cat| cat.mood = "happy"}
    end

    def sell_pets
        Cat.all.each {|cat| 
        cat.mood = "nervous"
        cat.owner = nil
        } && Dog.all.each {|dog| 
        dog.mood = "nervous"
        dog.owner = nil
        }
    end

    def list_pets
        # Dog.all.select {|dog| dog.owner == self}.count && Cat.all.select {|cat| cat.owner == self}.count
        "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
        # binding.pry
    end



end