class BeerReviews::Beers 
    attr_accessor :name, :url, :brewery, :style, :abv, :description
    attr_reader # to add? :details
    
    @@all = []

    def initialize(name=nil, url=nil, brewery=nil, style=nil, abv=nil)
        self.name = name
        self.url = "https://www.beeradvocate.com/lists/top-rated" + url
        self.brewery = brewery    
        self.style = style
        self.description = []
        # self.abv = []
        @@all << self
    end   

    def self.all
        @@all
    end   

    def self.find(id)
        self.all[id-1]
    end

end