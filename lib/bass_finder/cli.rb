class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the BASS FINDER app <---\n\n"
        get_and_create_models
        user_input = nil
        until user_input == "e"
         puts "Please select the bass you would like to look at using the corresponding number from the list:\n\n"
         show_bass_list
         puts "\n"
         get_user_bass
         puts "\nWould you like to look at another bass?  If yes, type 'y' or type 'e' to exit the app:\n\n"
         user_input = gets.strip
         puts "\n"
         if user_input == "y"

         elsif user_input == "e"

         end
        end
        puts "---> Thank you for using the BASS FINDER app! <---\n\n"
        puts "              ---> GOODBYE <---\n\n"
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
        chosen_bass = gets.strip
        if valid_input?(chosen_bass, @bass_list)
            get_and_show_info(chosen_bass) 
        else
            puts "\nPlease make a valid selection:\n\n"
            get_user_bass
        end
    end

    def valid_input?(chosen_bass, data)                                
        chosen_bass.to_i > 0 && chosen_bass.to_i <= data.length 
    end

    def get_and_show_info(chosen_bass)
        user_bass = @bass_list[(chosen_bass.to_i) - 1]
        show_bass = BassFinder::Model.all.find {|model| user_bass == model.name}
        if show_bass.features == []
         BassFinder::Scraper.scrape_model_details(show_bass)
        end 
          
        puts "\nHere are the specifications for #{show_bass.name}\n\n"
        puts "Price: #{show_bass.price}"
        puts show_bass.features
    end

    
end