class BeerReviews::CLI
    attr_accessor :name, :style, :brewery
    
    def call
        #loading
        # BeerReviews::Scraper.new.make_beers
        BeerReviews::Scraper.new.scrape_beers #FOR ORGINAL PART LISTING BEERS
        start
    end
        
    def start

        list_beers(1)
        
        puts ""
        puts "Which ranked beers would you like to see? 1-50, 51-100, 101-150, 151-200, 201-250?"
        input = gets.strip.to_i

        list_beers(input)
        
        puts "Please enter the number of the beer you would like to learn more about?"
        input = gets.strip
        
        beer = BeerReviews::Beers.find(input.to_i)

        # list_beer_details(beer)

        puts "Would you like to learn about another beer? Type list to return to list, or exit to leave."
        choose_beer_selection
    end

    def choose_beer_selection
        
            input = gets.strip.downcase

            if input == "list"
                start
            elsif input.strip.downcase == "exit"
                goodbye
            else
                puts "Sorry, I do not understand. Please type list to return to beer list, or type exit to leave."
            end
    end

    
    def list_beers(from_number)
        puts " Beers #{from_number} - #{from_number+49} "
        BeerReviews::Beers.all[from_number-1, 50].each.with_index(from_number) do |beer, index|
            puts "#{index}. #{beer.name} - #{beer.style}"
            puts "     #{beer.brewery}"
        end
    end

    def list_beer_details(beer)
        puts "#{beer.name} - #{beer.style}" # to add
        puts "#{beer.brewery} - #{beer.state}, #{beer.country}" # to add 
        #     puts "#{details.abv}"
        #     puts "Beer Advocate Score: #{beer.score}/5"
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