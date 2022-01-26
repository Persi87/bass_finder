class BassFinder::Model

    attr_accessor :name, :brand, :model_url

    @@all = []

    def initialize(name, brand)
        @name = name
        @brand = brand
        @model_url = model_url
        brand.models << self
        save
    end

    def self.save
        @@all << self
    end

    def self.all
        @@all
    end


end