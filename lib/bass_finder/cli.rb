class BassFinder::CLI

    # def call
    #     puts "\n ---> Welcome to the Bass Finder app <---\n\n"
    #     get_and_create_models
    #     puts "\nPlease select the bass you would like to look at using the corresponding number from the list:\n\n"
    #     show_bass_list
    #     puts "\n"
    #     get_user_bass
    #     user_input = nil
    #     until user_input == "e"
    #         puts "\nWould you like to look at another bass?  If yes, type 'y', or type 'e' to exit the app:\n\n"
    #     user_input = gets.strip
    #      if user_input == "y"
    #         puts "\nPlease select the bass you would like to look at using the corresponding number from the list:\n\n"
    #     puts "\n"
    #         show_bass_list
    #         puts "\n"
    #         get_user_bass
    #      elsif user_input == "e"

    #      else
    #         puts "Please make a valid selection:"
    #      end
    #     end
    #     puts "\n---> Thank you for using the Bass Finder app <---\n\n"
    #     puts "          ---> Goodbye <---\n\n"
    # end

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        get_and_create_models
        user_input = nil
        until user_input == "e"
        puts "\nPlease select the bass you would like to look at using the corresponding number from the list:\n\n"
        show_bass_list
        puts "\n"
        get_user_bass
            puts "\nWould you like to look at another bass?  If yes, type 'y', or type 'e' to exit the app:\n\n"
        user_input = gets.strip
         if user_input == "y"
            
         elsif user_input == "e"

         else
            puts "Please make a valid selection:"
         end
        end
        puts "\n---> Thank you for using the Bass Finder app <---\n\n"
        puts "          ---> Goodbye <---\n\n"
    end


    def get_and_create_models
       BassFinder::Scraper.scrape_product_tabs.each do |bass_info|
            BassFinder::Model.new(bass_info[0], bass_info[1], bass_info[2], bass_info[3])
       end
    end

    def show_bass_list
        @bass_list = BassFinder::Model.all.collect {|model| model.name}.sort
        @bass_list.each.with_index(1) {|bass, index| puts "#{index}. #{bass}"}
    end

    def get_user_bass
        # puts "\nPlease select the bass you would like to look at using the corresponding number from the list:\n\n"
        # puts "\n"
        # show_bass_list
        # puts "\n"
        @chosen_bass = gets.strip
        if valid_input?(@chosen_bass, @bass_list)
            get_and_show_info(@chosen_bass) 
        else
            puts "\nPlease make a valid selection:\n\n"
            get_user_bass
        end
    end

    def valid_input?(chosen_brand, data)                                #this is helper method for #get_user_brand and #get_user_model
        chosen_brand.to_i > 0 && chosen_brand.to_i <= data.length       #user_input is more than 0 and less than the length of the scraped array
    end

    def get_and_show_info(chosen_bass)
        user_bass = @bass_list[(chosen_bass.to_i) - 1]
        show_bass = BassFinder::Model.all.find {|model| user_bass == model.name}
        BassFinder::Scraper.scrape_model_details(show_bass)
        puts "\nHere are the specifications for #{show_bass.name}\n\n"
        puts "Price: #{show_bass.price}"
        puts show_bass.features
    end

    
end