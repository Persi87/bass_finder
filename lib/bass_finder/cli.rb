class BassFinder::CLI

    def call
        puts "\n ---> Welcome to the Bass Finder app <---\n\n"
        # bass_app
        get_and_create_models
        create_brand_list
        get_user_brand
        get_user_model
        puts "\n---> Thank you for using the Bass Finder app <---\n\n"
        puts "          ---> Goodbye <---\n\n"
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
        puts "\nPlease select the brand of bass you would like to look at, using the corresponding number from the list:\n\n"
        show_brand_list
        puts "\n"
        @chosen_brand = gets.strip
        show_guitars(@chosen_brand) if valid_input?(@chosen_brand, @brand_list)
    end

    def valid_input?(chosen_brand, data)                                #this is helper method for #get_user_brand and #get_user_model
        chosen_brand.to_i > 0 && chosen_brand.to_i <= data.length       #user_input is more than 0 and less than the length of the scraped array
    end

    def show_guitars(chosen_brand)
        user_brand = @brand_list[(chosen_brand.to_i) - 1] # this is a helper method for get #get_user_brand
        puts "\nHere are all #{user_brand} basses!\n\n"
        
        @model_list = []
        
        BassFinder::Model.all.each {|model| @model_list << model if user_brand == model.brand}

        @model_list.each.with_index(1) {|model, index| puts "#{index}. #{model.name}"}
    end

    def get_user_model
        puts "\nPlease select the bass you would like to look at, using the corresponding number from the list:\n\n"
        @chosen_model = gets.strip.to_i
        get_and_show_info(@chosen_model) if valid_input?(@chosen_model, @model_list)
    end

    def get_and_show_info(chosen_model)
        user_model = @model_list[(chosen_model.to_i) - 1]
        BassFinder::Scraper.scrape_model_details(user_model)
        puts "\nHere are the specifications for #{user_model.name}\n\n"
        puts "Price: #{user_model.price}"
        puts user_model.features
        puts "\n"
    end

    def bass_app
        #RUNNING ORDER OF APP
        #welcome
        #show brands
        #pick brand or exit
        #show models of selected brand
        #pick model, go back to show brands and pick new brand or exit
        #pick another model from same brand, go back to show brands and pick new brand or exit
    end

end