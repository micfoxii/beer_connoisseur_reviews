class BeerReviews::Scraper

    def get_page
        Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    end

    def scrape_beers
        self.get_page.search("td.hr_bottom_light")
    end

    def make_beers
        scrape_beers.each do |b|
           BeerReviews::Beers.new_from_index_page(b)
        end
    end
end


        