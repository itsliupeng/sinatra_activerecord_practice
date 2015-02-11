require 'active_record'
require 'sinatra/activerecord'

# ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'foobar.db'

# configure :development do
#   ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'foobar.db'
# end

set :database, {adapter: "sqlite3", database: "foobar.db"}
