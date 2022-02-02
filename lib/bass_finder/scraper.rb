class BassFinder::Scraper

    def self.scrape_product_tabs

        all_bass_array = []

        bass_page = "https://www.dv247.com/en_GB/GBP/Basses/4-String-Electric-Bass/cat-BASS-BASEB4?PageSize=90&SortingAttribute=Relevance-desc&SearchParameter"
        html = URI.open(bass_page)
        doc = Nokogiri::HTML(html)

        doc.css(".ident.grid").each do |bass_tab|
            model_name = bass_tab.css(".name.kor-product-link.js-tracking span").text
            model_brand = bass_tab.css(".manufacturer-img-box img").attribute("title").text
            model_url = bass_tab.css("a").attribute("href").value
            model_price = bass_tab.css(".final.kor-product-sale-price-value").text.delete(" ")
            
            all_bass_array << [model_name, model_brand, model_url, model_price]
        end   

        all_bass_array
          
    end

    def self.scrape_model_details(user_model)
        BassFinder::Model.all.each do |model|
            # binding.pry
          if user_model == model 
            html = URI.open(model.url)
            doc = Nokogiri::HTML(html)

            doc.css(".row.feature-box li").each do |feature|
                model.features << feature.text.delete("\n")
            end
          end
        end
    end

end