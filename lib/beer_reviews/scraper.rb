class BeerReviews::Scraper

    def scrape_beers
        doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
        klass = doc.search("td.hr_bottom_light")
        array_name_link = klass.css("a:nth-child(1)")

        array_name_link.map do |link|
            BeerReviews::Beers.new(link.text, link.attributes["href"].value)
        end
    end

    # def scrape_details(beers)
    #     doc = Nokogiri::HTM(open(beers.url))
    #     klass = doc.search("div.break")
    #     details = doc.css("")
    #     array
    #     binding.pry
        
    # end

    # def make_beers
    #     scrape_beers.map do |b|
    #        BeerReviews::Beers.new_from_index_page(b)
    #     end
    # end
    
    # def make_beers
    #     scrape_beers.collect do |b|
    #         index = "https://www.beeradvocate.com/lists/top/"
    #         name = b.css("a b").text
    #         brewery = b.css("span a:nth-child(2)").text
    #         #style =
    #         url = index + b.css("a:nth=child(1)").attribute('href').to_s
    #         new_beer = BeerReviews::Beers.new(name, brewery, url)
    #         new_beer
    #     end
    # end

    # code to scrape href beer tags
    # links = page.css("td.hr_bottom_light a:nth-child(1)")
    # links.map {|link| link.attribute('href').to_s}
    
end


        