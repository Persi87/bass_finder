class BassFinder::Model

    attr_accessor :name, :brand, :url

    @@all = []

    def initialize(name, brand, url)
        @name = name
        @brand = brand
        @url = url
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end


end