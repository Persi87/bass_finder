class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        #create brands
        get_brands
        list_brands 
        get_user_brand
        #list guitars 
        #get user guitar
        #list guitar specs
    end

    def get_brands
        @brand_list = BassFinder::Brand.all
        
        #BassFinder::Scraper.scrape_brands.uniq.sort # put scrape in different method
    end

    def list_brands
        puts "Please choose a brand from the list:\n\n"
                
        @brand_list.each.with_index(1) do |brand, index|
            puts "#{index}. #{brand}"
        end
        puts "\n"
    end

    def get_user_brand
        chosen_brand = gets.strip
        show_guitars(chosen_brand) if valid_input?(chosen_brand, @final_brand_list)
    end

    def valid_input?(chosen_brand, data)                            #this is helper method for #get_user_brand
        chosen_brand.to_i > 0 && chosen_brand.to_i <= data.length #user_input is more than 0 and less than the length of the scraped array
    end

    def show_guitars(chosen_brand)
        user_brand = @final_brand_list[chosen_brand - 1]    # this is a helper method for get #get_user_brand
        puts "Here are all products by #{user_brand}!"
    end


end