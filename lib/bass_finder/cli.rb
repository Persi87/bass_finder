class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        get_and_create_models
        create_and_show_list
        get_user_model
        #get_user_bass
        #list_guitars_with_brand
        # list guitar specs

    end

    def get_and_create_models
       BassFinder::Scraper.scrape_product_tabs.each do |bass_info|
            BassFinder::Model.new(bass_info[0], bass_info[1], bass_info[2], bass_info[3])
       end
    end

    def create_and_show_list
        @brand_list = BassFinder::Model.all.collect {|model| model.brand}.uniq

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
        puts "\nHere are all #{user_brand} basses!\n\n"
        
        @model_list = []
        
        BassFinder::Model.all.each {|model| @model_list << model if user_brand == model.brand}

        @model_list.each.with_index(1) {|model, index| puts "#{index}. #{model.name}"}

        if @model_list == 1 
            puts "\nPlease choose a bass from the list above to see more information:\n\n"
        else
            puts "\nPlease choose a bass from the list above to see more information, 1 - #{@model_list.length}:\n\n"
        end
    end

    def get_user_model
        chosen_model = gets.strip.to_i
        show_guitars(chosen_brand) if valid_input?(chosen_brand, @brand_list)
    end


end