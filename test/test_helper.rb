ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "./api"
require "json"
require "rack/test"

require "database_cleaner"
DatabaseCleaner.strategy = :truncation

