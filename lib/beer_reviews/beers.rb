class BeerReviews::Beers 
    attr_accessor :name, :style, :brewery, :url
    attr_reader :details
    
    @@all = []

    def initialize(name=nil, url=nil ) #would like to add brewery and style
        @name = name
        # @brewery = brewery
        # @style = style
        @url = "https://www.beeradvocate.com/lists/top/" + url
        @details = []
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

    def self.find(id)
        self.all[id-1]
    end

    def state
        @state ||= doc.css("div.break a")[2].text
    end

    def country
        @country ||= doc.css("div.break a")[3].text
    end

    # def abv

    # end

    def score
        @score ||= doc.css("span.ba-ravg").text       
    end

    # def availability

    # end

    # def description

    # end

    def doc 
        @doc ||= Nokogiri::HTML(open(self.url))
    end
end