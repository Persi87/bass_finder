class BassFinder::Model

    attr_accessor :name :brand

    @@all = []

    def initialize(name, brand)
        @name = name
        @brand = brand
    end

end