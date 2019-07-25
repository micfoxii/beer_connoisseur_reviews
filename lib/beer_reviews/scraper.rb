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
       
        self.scrape_beer_details
    end
      
    
    def self.scrape_beer_details
        BeerReviews::Beers.all.each do |beers|
            binding.pry
            doc = Nokogiri::HTML(open(beers.url))
            beers.description << doc.css("div#info_box").text.split("\n")[-1]
        end
    end


end     



    




        