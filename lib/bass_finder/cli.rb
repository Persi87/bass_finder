class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        # bass_app
        get_and_create_models
        create_brand_list
        bass_app
    end

    def get_and_create_models
       BassFinder::Scraper.scrape_product_tabs.each do |bass_info|
            BassFinder::Model.new(bass_info[0], bass_info[1], bass_info[2], bass_info[3])
       end
    end

    def create_brand_list
        @brand_list = BassFinder::Model.all.collect {|model| model.brand}.uniq.sort
    end

    def show_brand_list
        @brand_list.each.with_index(1) {|brand, index| puts "#{index}. #{brand}"}
    end

    def get_user_brand
        puts "\nPlease select the brand of bass you would like to look at, using the corresponding number from the list or type 'exit' to leave the app:\n\n"
        show_brand_list
        puts "\n"
        @chosen_brand = gets.strip
        if valid_input?(@chosen_brand, @brand_list)
            get_guitars(@chosen_brand) 
        elsif @chosen_brand == "exit"
            puts "\n---> Thank you for using the Bass Finder app <---\n\n"
            puts "          ---> Goodbye <---\n\n"
            exit
        else
            puts "\nYou have not selected a valid option."
            get_user_brand
        end
    end

    def valid_input?(chosen_brand, data)                                #this is helper method for #get_user_brand and #get_user_model
        chosen_brand.to_i > 0 && chosen_brand.to_i <= data.length       #user_input is more than 0 and less than the length of the scraped array
    end

    def get_guitars(chosen_brand)
        user_brand = @brand_list[(chosen_brand.to_i) - 1] # this is a helper method for get #get_user_brand
        puts "\nHere are all #{user_brand} basses!"
        
        @model_list = []
        
        BassFinder::Model.all.each {|model| @model_list << model if user_brand == model.brand}

    end

    def show_guitars
        @model_list.each.with_index(1) {|model, index| puts "#{index}. #{model.name}"}
    end

    def get_user_model
        puts "\nPlease select the bass you would like to look at using the corresponding number from the list,"
        puts "type 'brands' to select a different brand or type 'exit' to leave the app!\n\n"
        show_guitars
        puts "\n"
        @chosen_model = gets.strip
        if valid_input?(@chosen_model, @model_list)
            get_and_show_info(@chosen_model)
        elsif @chosen_model == "brands"
            get_user_brand
        elsif @chosen_model == "exit"
            puts "\n---> Thank you for using the Bass Finder app <---\n\n"
            puts "          ---> Goodbye <---\n\n"
            exit
        else
            puts "\nYou have not selected a valid option."
            get_user_model
        end
    end

    def get_and_show_info(chosen_model)
        user_model = @model_list[(chosen_model.to_i) - 1]
        BassFinder::Scraper.scrape_model_details(user_model)
        puts "\nHere are the specifications for #{user_model.name}\n\n"
        puts "Price: #{user_model.price}"
        puts user_model.features
        puts "\nWould you like to look at another bass from #{user_model.brand}?  If yes, type 'y':" 
        puts "Type 'brands' to select a different brand, or type 'exit' to leave the app:\n\n"
        input = gets.strip
        until input == input
        if input == "y" 
            get_user_model
        elsif input == "brands"
            get_user_brand
        elsif input == "exit"
            puts "\n---> Thank you for using the Bass Finder app <---\n\n"
            puts "          ---> Goodbye <---\n\n"
            exit
        end
        end
    end

    def bass_app
        get_user_brand
        get_user_model
    end

end