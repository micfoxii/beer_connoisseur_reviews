class BeerReviews::CLI
    def call
        
        list_beers
        menu
    end

    def list_beers
        puts 'Welcome, are you ready to find your new favorite beer?'
        
        @beers = BeerReviews::Beers.all
    end

    def menu
        puts "Please enter the number of the beer you would like to learn more about, or type exit to leave."
        input = nil
        while input != "exit"
            input = gets.strip.downcase
            case input
            when "1"
                puts "More info on beer 1..."
            when "2"
                puts "More info on beer 2..."
            when "list"
                list_beers
            else
                puts "Sorry, I do not understand. Please type list to return to beer list, or type exit to leave."
            end
        end
    end

    def goodbye
        puts "See you next time and remember to drink responsibly!"
    end

end