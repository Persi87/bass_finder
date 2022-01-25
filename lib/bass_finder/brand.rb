class BassFinder::Brand

        attr_accessor :name, :model

        @@all = []
    
    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

end
