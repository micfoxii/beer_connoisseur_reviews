require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "./beer_reviews/version"
require_relative "./beer_reviews/cli"
require_relative "./beer_reviews/beers"
require_relative "./beer_reviews/scraper"


module BeerReviews
  class Error < StandardError; end
  # Your code goes here...
end
