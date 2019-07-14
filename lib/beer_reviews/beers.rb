class BeerReviews::Beers 
    attr_accessor :name, :style, :brewery, :url
    attr_reader :details
    
    @@all = []

    def initialize(name=nil, url=nil ) #would like to add brewery and style
        @name = name
        # @brewery = brewery
        # @style = style
        @url = "https://www.beeradvocate.com/lists/top/" + url
        @@all << self
    end   

    # def self.new_from_index_page(b)
    #     self.new(
    #         b.css("a b").text,
    #         # b.css("span a:nth-child(2)").text,
    #         # b.css("span a:nth-child(2n+1)").text,
    #         #"#{b.css("a:nth=child(1)").attribute("href").text}"
    #     )
    # end

    def self.all
        @@all
    end   
end