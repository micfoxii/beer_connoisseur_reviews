class BeerReviews::Scraper
    attr_accessor :doc

    def initialize
        url = "https://www.beeradvocate.com/lists/top/"
        @doc = Nokogiri::HTML(open(url))
        binding.pry
    end

    def self.scrape_beers
        name = @doc.css("td.hr_bottom_light a b").text
        brewery = @doc.css("td.hr_bottom_light span a")[0].text
        style = @doc.css("td.hr_bottom_light span a")[1].text
        url = @doc.css("td.hr_bottom_light a").attribute("href").value

        # beers = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
        # beers.css("td.hr_bottom_light a b").each do |beer|

        
        #     name = beer.text
        #     BeerReviews::Beers.new(name)
        # end
    end    

    
end


        