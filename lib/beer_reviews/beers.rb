class BeerReviews::Beers 
    attr_reader :name, :style, :brewery
    
    @@all = []

    def self.create_beers(b)
        self.new(
            b.css("b").text, 
            b.css("#extendedInfo a")[0].text,
            b.css("#extendedInfo a")[1].text
        )
    end

    def initialize(name=nil, style=nil, brewery=nil)
        @name = name
        @style = style
        @brewery = brewery
        @@all << self
    end

    def self.all
        @@all
    end
end
