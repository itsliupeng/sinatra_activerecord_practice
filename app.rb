
# app.rb
require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/reloader' if development?


require './post.rb'
#
# # or set :database_file, "path/to/database.yml""


ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'foobar.db'

class MyApp < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    use Rack::MethodOverride

    get '/posts' do
      @posts = Post.all
      erb :"index.html"
    end

    post '/posts' do
      p params.inspect
      @post = Post.create!(title: params[:post][:title], content: params[:post][:content])
      erb :"show.html"
    end

    get '/posts/new' do
      @post = Post.new
      puts "hello, get posts/new"
      erb :"new.html"
    end

    get '/posts/:id' do
      @post = Post.find(params[:id])
      erb :"show.html"
    end

    get '/posts/:id/edit' do
      puts "hi, get /posts/:id/edit"
      @post = Post.find(params[:id])
      erb :"edit.html"
    end

    patch '/posts/:id' do
      @post = Post.find(params[:id])
      # @post.update()


    end

    put '/posts/:id' do
      p params
      @post = Post.find(params[:id])
      @post.update_attributes(params[:post])
      redirect to "/posts/#{@post.id}"

    end

    delete '/posts/:id' do
      p params.inspect
      @post = Post.find(params[:id])
      @post.destroy!
      redirect to "/posts"
    end


end

# post = Post.create!(title: "hello", content: "hello, world")
# p post

