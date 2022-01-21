# frozen_string_literal: true

require_relative "bass_finder/version"
require_relative "./bass_finder/cli"
require_relative "./bass_finder/scraper"
require_relative "./bass_finder/guitar"

require 'pry'

module BassFinder
  class Error < StandardError; end
  # Your code goes here...
end
