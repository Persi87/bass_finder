class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        #create brands
        list_brands 
        get_user_brand
        #list guitars 
        #get user guitar
        #list guitar specs
    end

    def list_brands
        puts "Please choose a brand from the list:\n\n"
        
        @final_brand_list = BassFinder::Scraper.scrape_brands.uniq.sort {|a, b| a <=> b}
        
        @final_brand_list.each.with_index(1) do |brand, index|
            puts "#{index}. #{brand}"
        end
        puts "\n"
    end

    def get_user_brand
        user_input = gets.strip
        binding.pry
        # list_guitars if valid_input?(user_input, @final_brand_list)
    end

    def valid_input?(user_input, data)
        user_input.to_i > 0 && user_input.to_i <= data.length #user_input is more than 0 and less than the length of the scraped array
    end


end