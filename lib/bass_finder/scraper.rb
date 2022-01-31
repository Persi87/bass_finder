class BassFinder::Scraper

    def self.scrape_product_tabs

        brand_list = []

        bass_page = "https://www.dv247.com/en_GB/GBP/Basses/4-String-Electric-Bass/cat-BASS-BASEB4?PageSize=90&SortingAttribute=Relevance-desc&SearchParameter"
        html = URI.open(bass_page)
        doc = Nokogiri::HTML(html)

        doc.css(".ident.grid").each do |bass_tab|
            model_name = bass_tab.css(".name.kor-product-link.js-tracking span").text
            model_brand = bass_tab.css(".manufacturer-img-box img").attribute("title").text
            model_url = bass_tab.css("a").attribute("href").value

            BassFinder::Model.new(model_name, model_brand, model_url)
        end   
          
    end

    def self.scrape_model_details(model)
        html = URI.open(model.url)
        doc = Nokogiri::HTML(html)

        doc.css("").each do |feature|
            feature.css(".contentText li")
    end

end