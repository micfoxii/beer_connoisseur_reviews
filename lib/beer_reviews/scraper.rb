class BeerReviews::Scraper

    ####################### Currently Working to Pull Name/URL Tag, Brewery, & Style#################
    def self.scrape_beers
        doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top-rated/"))
        doc.css("table tr")[1..25].each do |beer_data|
            BeerReviews::Beers.new(
            name = beer_data.css("/td/a").text, #name    
            url_tag = beer_data.css("/td/a/@href").text, #url
            brewery = beer_data.css("/td/span/a:nth-child(2)").text, # brewery          
            style = beer_data.css("/td/span/a:nth-child(4)").text, # style 
            # abv = beer_data.css("/td/span/a:nth-child(5)") #abv
            )
        end
    end
      
    
    def self.scrape_beer_details(beer)
        doc = Nokogiri::HTML(open(beer.url))
        notes = doc.css("div#info_box")
        beer.description << notes.text.split("\n")[-1]
    end
end     



    




        