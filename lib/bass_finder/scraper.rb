class BassFinder::Scraper

    def self.scrape_brands

        brand_list = []

        bass_page = "https://www.dv247.com/en_GB/GBP/Basses/4-String-Electric-Bass/cat-BASS-BASEB4?PageSize=90&SortingAttribute=Relevance-desc&SearchParameter"
        html = URI.open(bass_page)
        doc = Nokogiri::HTML(html)

        doc.css(".ident.grid").each do |bass_tab|
            bass_brand = bass_tab.css(".manufacturer-img-box img").attribute("title").text
            brand_list << bass_brand
        end   

        brand_list # brand_list contains all 90 brands inc duplicates

        #   doc.css(".ident.grid a").attribute("href").value # this is for the individual guitar hopefully

          
    end

end