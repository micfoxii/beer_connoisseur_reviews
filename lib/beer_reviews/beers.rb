class BeerReviews::Beers 
    attr_accessor :name, :url, :brewery, :style, :state, :country, :score #to add : 
    attr_reader :details
    
    @@all = []

    ##################################### Currently Working to Populate Name/URL ########################################
    def initialize(name=nil, url=nil, brewery=nil, style=nil) #TO DO , brewery=nil, style=nil 
        @name = name
        @url = "https://www.beeradvocate.com/lists/top/" + url
        @brewery = brewery    #CURRENTLY NOT WORKING
        @style = style        #CURRENTLY NOT WORKING
        # details = []        # TO DO IF MAKING DETAILS SEPARATE CLASS
        @@all << self
    end   

    def self.all
        @@all
    end   

    def self.find(id)
        self.all[id-1]
    end

#########################################################################################################################
####################################### Format Like Worlds Best Restaurants #############################################
#########################################################################################################################

    # def self.new_from_list(b)
    #     self.new(
    #         b.css("//td/a").text, #name    
    #         "https://www.beeradvocate.com/lists/top/#{b.css("//td/a/@href").text}", #url
    #         b.css("//td/span/a:nth-child(2)").text, # brewery          
    #         b.css("//td/span/a:nth-child(4)").text # style 
    #     )
    # end

    # def initialize(name = nil, url = nil, brewery = nil, style = nil)
    #     @name = name
    #     @url = url
    #     @brewery = brewery
    #     @style = style
    #     @@all << self
    # end

    # def self.all
    #     @@all
    # end   

    # def self.find(id)
    #     self.all[id-1]
    # end


    ##################################################################################################################
    ############################################# Details TO DO ######################################################
    ##################################################################################################################

    # def brewery
    #     @brewery ||= doc.css("//div.break/a/b").shift.text
    # end

    # def style
    #     @style ||= doc.css("//div.break/a/b:nth-child(1)").pop.text
    # end

    # def state
    #     @state ||= doc.css("//div.break/a")[1].text
    # end

    # def country
    #     @country ||= doc.css("//div.break/a")[2].text
    # end

    # def abv
    #     @abv || = doc.css("//div.break")
    # end

    # def score
    #     @score ||= doc.css("//span.ba-ravg").text       
    # end

    # def availability

    # end

    # def description
    #     @description || doc.css("//div.break")
    # end

    def doc 
        @doc ||= Nokogiri::HTML(open(self.url))
    end
end