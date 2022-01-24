class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        #create brands 
        #list brands
        #get users brand
        #list guitars 
        #get users guitar
        #list guitar specs
    end

    def valid_input(input, data)
        input > 0 && input <= data.length #user input is more than 0 and less than the length of the scraped array
    end

    def create_brands
        BassFinder.Scraper.scrape_brands
    end
    

end