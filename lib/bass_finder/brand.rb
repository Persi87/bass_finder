class BassFinder::Brand

        attr_accessor :name, :models

        @@all = []
    
    def initialize(name, models)
        @name = name
        @models = []
        save
    end

    def self.save
        @@all << self
    end

    def self.all
        @@all
    end

end
