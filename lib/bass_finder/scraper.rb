class BassFinder::Scraper

    def self.scrape_brands
        bass_page = "https://www.dv247.com/en_GB/GBP/Basses/4-String-Electric-Bass/cat-BASS-BASEB4?PageSize=90"
        html = URI.open(bass_page)
        doc = Nokogiri::HTML(html)
        binding.pry
         brands = doc.css(".product-list-box").collect do |bass_tile|

            
         end


    end

end