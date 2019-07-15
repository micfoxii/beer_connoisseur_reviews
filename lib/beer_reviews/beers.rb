class BeerReviews::Beers 
    attr_accessor :name, :url, :style, :brewery, :state, :country, :score #to add : 
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

    # def brewery
    #     @brewery ||= doc.css("div.break a")[1].text
    # end

    # def style
    #     @style ||= doc.css("div.break a")[5].text
    # end

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

    # .css('div.break').text returns 
    #"\n\nBA SCORE \n\n4.84/5\nWorld-Class\n\n\n\n\nBEER INFO\n\nBrewed by:\n\nToppling Goliath Brewing Company\nIowa, United Statestgbrews.com \nStyle: American Imperial Stout\n\nAlcohol by volume (ABV): 12.00%\n\nAvailability: Rotating\n\nNotes / Commercial Description:\n\nThis beer is the real McCoy. Barrel aged and crammed with coffee, none other will stand in it\u2019s way. Sought out for being delicious, it is notoriously difficult to track down. If you can find one, shoot to kill, because it is definitely wanted... dead or alive. \n\n\nBEER STATS\n\n\nRanking:\n#1\nReviews:\n143\nRatings:\n767\n\npDev:\n\n6.4% \n\n\u00A0\n\u00A0\nWants:\n3,828\nGots:\n114\nTrade:\n4\n\n\n\n"
    
    def doc 
        @doc ||= Nokogiri::HTML(open(self.url))
    end
end