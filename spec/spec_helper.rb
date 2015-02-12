ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require File.expand_path '../../app', __FILE__


require File.expand_path '../../config/environment', __FILE__
require 'active_record'
ActiveRecord::Migrator.migrate(File.expand_path('../../db/migrate', __FILE__))

include Rack::Test::Methods

def app
  MyApp
end
