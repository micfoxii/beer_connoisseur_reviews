class BeerReviews::Beers 
    attr_accessor :name, :style, :brewery
    
    @@all = []

    def initialize(name=nil, style=nil, brewery=nil)
        @name = name
        # @style = style
        # @brewery = brewery
        @@all << self
    end   
    
    def self.all
        BeerReviews::Scraper.scrape_beers if @@all.empty?
        @@all
    end   
end
