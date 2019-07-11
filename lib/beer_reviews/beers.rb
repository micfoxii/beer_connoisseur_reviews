class BeerReviews::Beers 
    attr_accessor :name, :type, :brewery, :city, :country, :abv, :ibu, :hops, :malts, :description, :author, :review
    
    def self.all
        
        self.scrape_beers
    end

    def self.scrape_beers
        # beers = []
        # beers << self.scrape_beers

        # Go to Beer Conneusoir
        # Extract Properties (name, brewery, type)
        # instantiate beers

        beer_1 = self.new
        beer_1.name = "Jammer"
        beer_1.type = "Gose"
        beer_1.brewery = "Sixpoint Brewery"

        beer_2 = self.new
        beer_2.name = "Higher Burnin IPA"
        beer_2.type = "American IPA"
        beer_2.brewery = "LIC Beer Project"

        beer_3 = self.new
        beer_3.name = "Better Selves"
        beer_3.type = "Specialty IPA"
        beer_3.brewery = "Able Seedhouse and Brewery"

        [beer_1, beer_2, beer_3]
        #doc = Nokogiri::HTM(open("https://beerconnoisseur.com/search-beer"))

        # name = doc.("div.views-field.views-field-title").css("span.field-content a").text
        
        # brewery = page.css("div.views-field.views-field-field-brewery").css("div.field-content a").text

        # type = page.css("div.views-field.views-field-field-beer-style").css("div.field-content a").text
        #beers
    end        
end
