class BeerReviews::Scraper

    def get_page
        Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    end

    def scrape_beers
        self.get_page.css(".hr_bottom_light[@align='left']")
    end    
    
    def create_beers
        scrape_beers.each do |b|
            BeerReviews::Beers.beers_from_list(b)
        end
    end

end


        