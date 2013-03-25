require 'geoservices'
require 'rspec'
require 'rspec/expectations'
require 'yaml'
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
