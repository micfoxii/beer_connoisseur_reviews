class BeerReviews::Scraper

    def self.scrape_beers
        doc = Nokogiri::HTM(open("https://beerconnoisseur.com/search-beer"))

        # name = doc.("div.views-field.views-field-title").css("span.field-content a").text
        
        # brewery = page.css("div.views-field.views-field-field-brewery").css("div.field-content a").text

        # type = page.css("div.views-field.views-field-field-beer-style").css("div.field-content a").text
    end

end