class BeerReviews::Scraper

    def self.scrape_beers
        doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
        
        beers = doc.css(".hr_bottom_light").css("a").css("b")
        beers.each do |b|
            name = b.text
            BeerReviews::Beers.new(name)
        end
    end    
end


        