# frozen_string_literal: true

require_relative "lib/bass_finder/version"

Gem::Specification.new do |spec|
  spec.name = "bass_finder"
  spec.version = BassFinder::VERSION
  spec.authors = ["Persi87"]
  spec.email = ["simon_black87@hotmail.co.uk"]

  spec.summary = "Find information and specs of 4 string bass guitars."
  spec.description = "Allows user to select a brand of bass guitar, then choose a bass guitar from the chosen brand and find out information on that guitar"
  spec.homepage = "http://www.Ihavenopage.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "http://www.mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.Ihavenopage.com"
  spec.metadata["changelog_uri"] = "http://www.Ihavenopage.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency 'open-uri'

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
