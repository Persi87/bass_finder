# frozen_string_literal: true

require_relative "bass_finder/version"
require_relative "./bass_finder/cli"
require_relative "./bass_finder/scraper"
require_relative "./bass_finder/model"
require_relative "./bass_finder/brand"

require 'pry'
require 'nokogiri'
require 'open-uri'

module BassFinder
  class Error < StandardError; end
  # Your code goes here...
end
