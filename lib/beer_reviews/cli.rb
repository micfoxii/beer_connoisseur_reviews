class BeerReviews::CLI
    def call
        
        list_beers
        menu
    end

    def list_beers
        puts 'Welcome, are you ready to find your new favorite beer?'
        puts <<-DOC.gsub /^\s*/, ''
        1. Osiris - Pale Ale
        2. Sunlight - Cream Ale
        3. Two Hearted - India Pale Ale
        DOC
    end

    def menu
        puts "Enter the number of the beer you would like to learn more about:"
        input = nil
        while input != "exit"
            input = gets.strip.downcase
            case input
            when "1"
                puts "More info on beer 1..."
            when "2"
                puts "More info on beer 2..."
            end
        end
    end

    def goodbye
        puts "See you next time and remember to drink responsibly!"
    end

end