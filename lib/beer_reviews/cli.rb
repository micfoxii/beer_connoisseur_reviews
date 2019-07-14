class BeerReviews::CLI
    attr_accessor :name, :style, :brewery
    def call

        BeerReviews::Scraper.new.make_beers
        puts ""
        puts "Retrieving beer list..."
        puts ""
        start

    end
        
    def start
        puts ""
        puts "Select a beer to see more details."
        list_beers
        
        input = gets.strip.to_i
        get_user_beer_selection
    end

    def get_user_beer_selection
        input = nil
        while input != "exit"
            puts "Please enter the number of the beer you would like to learn more about, or type exit to leave."
            input = gets.strip.downcase

            if input.to_i > 0 && input.to_i < @beers.length + 1
                #selected_beer = @beers[input.to_i-1] to replace with list_beer_details
                puts " #{beer.name} - #{beer.brewery} - #{beer.type}"
            elsif input == "list"
               list_beer_beers
            elsif input.strip.downcase == "exit"
                 goodbye
            else
                puts "Sorry, I do not understand. Please type list to return to beer list, or type exit to leave."
            end
        end
    end

    
    def list_beers
        BeerReviews::Beers.all.each.with_index(1) do |beer, index|
            puts "#{index}. #{beer.name} - #{beer.style}" # to add  - #{beer.brewery}
        end
    end

    # def list_beer_details(details)
    #     puts "#{beers.name} - #{beers.style}"
    #     puts "#{beers.brewery} - #{details.state}, #{details.country}"
    #     puts "#{details.abv}"
    #     puts "Beer Advocate Score: #{details.score}/5"
    #     puts "Availability: #{details.availability}"
    #     puts ""
    #     puts "#{details.description}" 
    # end

    def goodbye
        puts "See you next time and remember to drink responsibly!"
    end

end