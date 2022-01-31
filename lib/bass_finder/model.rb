class BassFinder::Model

    attr_reader :name, :brand, :url, :price, :features

    @@all = []

    def initialize(name, brand, url, price)
        @name = name
        @brand = brand
        @url = url
        @price = price
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