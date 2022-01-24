class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        #create brands Y
        #list brands 
        #get users brand
        #list guitars 
        #get users guitar
        #list guitar specs
    end

    def valid_input(input, data)
        input > 0 && input <= data.length #user input is more than 0 and less than the length of the scraped array
        binding.pry
    end

    def list_brands
        puts "Please choose a brand from the list:\n\n"
        
        @final_brand_list = BassFinder::Scraper.scrape_brands.uniq.sort {|a, b| a <=> b}
        
        @final_brand_list.each.with_index(1) do |brand, index|
            puts "#{index}. #{brand}"
        end
        puts "\n"
    end

    


end