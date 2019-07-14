class BeerReviews::Beers 
    attr_accessor :name, :style, :brewery, :url
    
    @@all = []

    def self.new_from_index_page(b)
        self.new(
            b.css("a b").text,
            b.css("span a:nth-child(2)").text,
            # b.css("span a")[1].text,
            "https://www.beeradvocate.com/lists/top/#{b.css("a").map {|anchor| anchor["href"]}}"
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

#     def state
#         @state ||= doc.css("div.break a")[2].text
#     end

#     def country
#         @country || doc.css("div.break a")[3].text
#     end

#     def abv

#     end

#     def score

#     end

#     def availability

#     end

#     def description

#     end

#     def doc 
#         @doc ||= Nokogiri::HMTL(open(self.url))
#     end
end
