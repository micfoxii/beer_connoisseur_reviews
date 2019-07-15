class BeerReviews::Scraper

    ##################################### Currently Working to Pull Name/Href ########################################
    def scrape_beers
        doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
        doc.css("table tr")[2..11].each do |beer_data|
            BeerReviews::Beers.new(
            beer_data.css("/td/a").text, #name    
            beer_data.css("/td/a/@href").text, #url
            beer_data.css("/td/span/a:nth-child(2)").text, # brewery          
            beer_data.css("/td/span/a:nth-child(4)").text # style 
            )
        end

        # klass = doc.css("//td")
        # array_name_link = klass.css("/a:nth-child(1)")
        # array_name_link.map do |link|
        #     BeerReviews::Beers.new(
        #         link.text, 
        #         link.attributes["href"].value
        #     )
        # end
        
        ###ENOCH CODE####
        #scrape_beer_attributes
    end

        ###ENOCH CODE####
    # def scrape_beer_attributes
    #     BeerReviews::Beers.all.each do |beer|
    #         beer.url
    #         beer.description = doc.css('.class-for-description')
    #     end
    # end

 #####################################################################################################################
 ############################# Modified From Above Code to include Brewery & Style ###################################
 #####################################################################################################################

    # def scrape_beers
    #     doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
               
    #     doc.map do |b|
    #         BeerReviews::Beers.new(
    #             b.css("/td/a").text, #name    
    #             b.css("/td/a/@href").text, #url
    #             b.css("/td/span/a:nth-child(2)").text, # brewery          
    #             b.css("/td/span/a:nth-child(4)").text # style          
    #         )
    #     end
    # end

 #####################################################################################################################
 ############################# Proposed Scraper For Beer Name, URL, Brewery, & Style #################################
 #####################################################################################################################

    # def get_page
    #     Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    # end

    # def make_beers
    #     get_page.each do |b|
    #         BeerReviews::Beers.new_from_list(b)
    #     end
    # end

    
end


        