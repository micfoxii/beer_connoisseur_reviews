class BeerReviews::CLI
    def call
        get_beer_name_brewery_type
        list_beer_name_brewery_type
        get_user_beer_selection
    end

    def get_beer_name_brewery_type
        @beers = BeerReviews::Beers.all
    end

    def list_beer_name_brewery_type
        puts 'Welcome, are you ready to find your new favorite beer?'
        @beers.each.with_index(1) do |beer, i|
            puts "#{i}. #{beer.name} - #{beer.brewery} - #{beer.type}"
        end
    end

    def get_user_beer_selection
        input = nil
        while input != "exit"
            puts "Please enter the number of the beer you would like to learn more about, or type exit to leave."
            input = gets.strip.downcase

            if input.to_i > 0 && input.to_i < @beers.length + 1
                selected_beer = @beers[input.to_i-1]
                puts " #{selected_beer.name} - #{selected_beer.brewery} - #{selected_beer.type}"
            elsif input == "list"
                list_beer_name_brewery_type
            elsif input.strip.downcase == "exit"
                 goodbye
            else
                puts "Sorry, I do not understand. Please type list to return to beer list, or type exit to leave."
            end
        end
    end

    def goodbye
        puts "See you next time and remember to drink responsibly!"
    end

end