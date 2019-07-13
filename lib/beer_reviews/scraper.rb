class BeerReviews::Scraper

    def self.scrape_beers
        doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
        binding.pry
        # beers = []
        # beers << self.scrape_beers

        # Go to Beer Advocate
        # Extract Properties (name, brewery, type)
        # instantiate beers

        # beer_1 = self.new
        # beer_1.name = "Jammer"
        # beer_1.type = "Gose"
        # beer_1.brewery = "Sixpoint Brewery"

        # beer_2 = self.new
        # beer_2.name = "Higher Burnin IPA"
        # beer_2.type = "American IPA"
        # beer_2.brewery = "LIC Beer Project"

        # beer_3 = self.new
        # beer_3.name = "Better Selves"
        # beer_3.type = "Specialty IPA"
        # beer_3.brewery = "Able Seedhouse and Brewery"

        # [beer_1, beer_2, beer_3]
        

        # name = doc.css("div.views-field.views-field-title").css("span.field-content a").text
        
        # brewery = page.css("div.views-field.views-field-field-brewery").css("div.field-content a").text

        # type = page.css("div.views-field.views-field-field-beer-style").css("div.field-content a").text
        #beers
    end        
end
        