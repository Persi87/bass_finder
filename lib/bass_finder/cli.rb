class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        get_and_create_models
        create_and_show_list
        get_user_brand
        get_user_model
    end

    def get_and_create_models
       BassFinder::Scraper.scrape_product_tabs.each do |bass_info|
            BassFinder::Model.new(bass_info[0], bass_info[1], bass_info[2], bass_info[3])
       end
    end

    def create_and_show_list
        @brand_list = BassFinder::Model.all.collect {|model| model.brand}.uniq.sort

        puts "Please select the brand of bass you would like to look at, using the corresponding number from the list and press enter:\n\n"
                
        @brand_list.each.with_index(1) do |brand, index|
            puts "#{index}. #{brand}"
        end
        puts "\n"
    end

    def get_user_brand
        chosen_brand = nil
        #  until chosen_brand == "exit"
         chosen_brand = gets.strip.to_i
         if valid_input?(chosen_brand, @brand_list)
            show_guitars(chosen_brand)
         else
            puts "\nPlease make a valid selection from the list, or type exit to leave the app:\n\n"
         end
        # end
    end

    def valid_input?(chosen_brand, data)                                #this is helper method for #get_user_brand
        chosen_brand.to_i > 0 && chosen_brand.to_i <= data.length       #user_input is more than 0 and less than the length of the scraped array
    end

    def show_guitars(chosen_brand)
        user_brand = nil
        # until user_brand == "exit"
         user_brand = @brand_list[(chosen_brand) - 1] # this is a helper method for get #get_user_brand
         puts "\nHere are all #{user_brand} basses!"
         puts "\nPlease select the bass you would like to look at, using the corresponding number from the list and press enter:\n\n"
        
         @model_list = []
        
         BassFinder::Model.all.each {|model| @model_list << model if user_brand == model.brand}

         @model_list.each.with_index(1) {|model, index| puts "#{index}. #{model.name}"}
         puts "\n"
    end

    def get_user_model
        chosen_model = nil
        # until chosen_model == "exit"
         chosen_model = gets.strip.to_i
         if valid_input?(chosen_model, @model_list)
            get_and_show_info(chosen_model) 
         else
            puts "\nPlease make a valid selection from the list:\n\n"
         end
        # end
    end

    def get_and_show_info(chosen_model)
        user_model = @model_list[(chosen_model) - 1]
        BassFinder::Scraper.scrape_model_details(user_model)
        puts "\nHere is information for #{user_model.name}\n\n"
        puts "Price: #{user_model.price}"
        puts user_model.features
        puts "\n"
    end


end