class BeerReviews::CLI
    attr_accessor :name, :style, :brewery
    
    def call
        #loading
        BeerReviews::Scraper.scrape_beers #FOR ORGINAL PART LISTING BEERS
        # BeerReviews::Scraper.new.scrape_beer_details
        start
    end
        
    def start

        list_beers
        user_selects_beer
        choose_beer_selection

    end 

    def list_beers
        puts " Beer Advocate's Top 25 Beers "
        BeerReviews::Beers.all.each.with_index(1) do |beer, index|
            puts "#{index}. #{beer.name} - #{beer.style} - abv #{beer.abv}"
            puts "     #{beer.brewery}"
            puts "     #{beer.url}"
        end
    end

    def user_selects_beer
        puts "\nPlease enter the number of the beer you would like to learn more about?"
        puts ""
        input = gets.strip

        beer = BeerReviews::Beers.find(input.to_i)

        list_beer_details(beer)
    end

    def choose_beer_selection
        puts "\nWould you like to learn about another beer? Type list to return to list, or exit to leave."
        input = gets.strip.downcase

        if input == "list"
            start
        elsif input.strip.downcase == "exit"
            goodbye
        else
            puts "\nSorry, I do not understand. Please type list to return to beer list, or type exit to leave."
            choose_beer_selection
        end
    end

    def list_beer_details(beer)
        puts "\n#{beer.name} - #{beer.style}" # to add
        puts "#{beer.brewery}" # to add  - #{beer.state}, #{beer.country}
        # puts "#{beer.abv}"
        # #     puts "Beer Advocate Score: #{beer.score}/5"
        # #     puts "Availability: #{details.availability}"
        # #     puts ""
        puts "NOTES: #{beer.description}" 
    end

    def goodbye
        puts "\nSee you next time and remember to drink responsibly!"
    end

    def loading 
        spinner = Enumerator.new do |e|
            loop do
                e.yield '|'
                e.yield '/'
                e.yield '-'
                e.yield '\\'
            end
        end

        1.upto(100) do |i|
            progress = "=" * (i/5) unless i < 5
            printf("\rRetrieving Beer List: [%-20s] %d%% %s", progress, i , spinner.next)
            sleep(0.1)
        end
    end

end