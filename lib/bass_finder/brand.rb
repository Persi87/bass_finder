class BassFinder::Brand

        attr_accessor :name, :model

        @@all = [1, 2, 3]
    
    def initialize(name, model)
        @name = name
        @model = model
        save
    end

    def self.save
        @@all << self
    end

    def self.all
        @@all
    end

end
