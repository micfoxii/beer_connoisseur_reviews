class BeerReviews::Beers 
    attr_accessor :name, :style, :brewery, :url
    
    @@all = []

    def self.new_from_index_page(b)
        self.new(
            b.css("a b").text,
            b.css("span a")[0].text,
            b.css("span a")[1].text,
            "https://www.beeradvocate.com/lists/top/#{b.css("a").attribute("href").value}"
        )
    end

    def initialize(name=nil, style=nil, brewery=nil, url=nil)
        @name = name
        @brewery = brewery
        @style = style
        @url = url
        @@all << self
    end   
    
    def self.all
        @@all
    end   

end
