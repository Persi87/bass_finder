class BassFinder::Model

    attr_accessor :name, :brand, :url , :features

    @@all = []

    def initialize(name, brand, url)
        @name = name
        @brand = brand
        @url = url
        @features = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end


end