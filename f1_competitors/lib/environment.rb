require_relative "./f1_competitors/version"
require_relative "./f1_competitors/cli"
require_relative "./f1_competitors/scraper"
require_relative "./f1_competitors/driver"
require "pry"
require "nokogiri"
require "open-uri"
require "colorize"

module F1Competitors
  class Error < StandardError; end
  # Your code goes here...
end
