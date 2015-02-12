require 'sinatra/activerecord'
require 'yaml'

db_options = YAML.load(File.read(File.expand_path('../database.yml', __FILE__)))

p db_options["test"]

ActiveRecord::Base.establish_connection(db_options["test"])

