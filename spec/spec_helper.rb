require 'bundler/setup'
Bundler.require :default, :test
# require_relative '../lib/date_plus.rb'

Dir["spec/support/**/*.rb"].each { |f| require File.expand_path f }

RSpec.configure do |c|
  c.fail_fast = true
  c.color = true
end
