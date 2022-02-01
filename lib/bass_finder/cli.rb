class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        get_and_create_model
        # list_brands
        # get_user_brand
        
        #list guitar specs
    end

    def get_and_create_model
        
       BassFinder::Scraper.scrape_product_tabs.each do |bass_info|
            binding.pry
        BassFinder::Model.new(bass_info[0], bass_info[1], bass_info[2], bass_info[3])
       end
       
    end

    def list_brands
        puts "Please choose a brand from the list, 1 - #{@brand_list.length}:\n\n"
                
        @brand_list.each.with_index(1) do |brand, index|
            puts "#{index}. #{brand}"
        end
        puts "\n"
    end

    def get_user_brand
        chosen_brand = gets.strip.to_i
        show_guitars(chosen_brand) if valid_input?(chosen_brand, @brand_list)
    end

    def valid_input?(chosen_brand, data)                                #this is helper method for #get_user_brand
        chosen_brand.to_i > 0 && chosen_brand.to_i <= data.length       #user_input is more than 0 and less than the length of the scraped array
    end

    def show_guitars(chosen_brand)
        user_brand = @brand_list[(chosen_brand) - 1] # this is a helper method for get #get_user_brand
        puts "\nHere are all products by #{user_brand}!\n\n"
    end


end