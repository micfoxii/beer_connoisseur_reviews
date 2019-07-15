class BeerReviews::CLI
    attr_accessor :name, :style, :brewery
    
    def call
        loading
        BeerReviews::Scraper.new.scrape_beers
        start
    end
        
    def start

        puts ""
        puts "Select a beer to see more details."
        
        list_beers
        input = gets.strip.to_i
        
        
        puts "Please enter the number of the beer you would like to learn more about, or type exit to leave."
        input = gets.strip
        
        beer = BeerReviews::Beers.find(input.to_i)
        list_beer_details(beer)

        puts "Would you like to learn about another beer? Type list to return to list, or exit to leave."
        choose_beer_selection
    end

    def choose_beer_selection
        input = nil
        while input != "exit"
            input = gets.strip.downcase

            if input.to_i > 0 && input.to_i < BeerReviews::Beers.all.length + 1
                beer = BeerReviews::Details.all[input.to_i-1]
                list_beer_details(beer)
            elsif input == "list"
                start
            elsif input.strip.downcase == "exit"
                goodbye
            else
                puts "Sorry, I do not understand. Please type list to return to beer list, or type exit to leave."
            end
        end
    end

    
    def list_beers
        BeerReviews::Beers.all.each.with_index(1) do |beer, index|
            puts "#{index}. #{beer.name}- #{beer.brewery}" # to add   - #{beer.style}
        end
    end

    def list_beer_details(beer)
        puts "#{beer.name} - #{beer.style}" # to add
        puts "#{beer.brewery} - #{beer.state}, #{beer.country}" # to add 
        #     puts "#{details.abv}"
        puts "Beer Advocate Score: #{beer.score}/5"
        #     puts "Availability: #{details.availability}"
        #     puts ""
        #     puts "#{details.description}" 
    end

    def goodbye
        puts "See you next time and remember to drink responsibly!"
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