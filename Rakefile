require "sinatra/activerecord/rake"
require 'rake/testtask'


namespace :db do
  desc "load db config"
  task :load_config do
    require "./app"
    puts "hi, load_config"
  end
end

Rake::TestTask.new do |t|
  t.pattern = "./spec/app_spec.rb"
end
