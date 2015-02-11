require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/reloader' if development?

require './models/post'
require './config/database'

# ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: 'foobar.db'

class MyApp < Sinatra::Base
    # register Sinatra::ActiveRecordExtension

    use Rack::MethodOverride

    get '/posts' do
      @posts = Post.all
      erb :"index.html"
    end

    post '/posts' do
      p params.inspect
      @post = Post.create!(title: params[:post][:title], content: params[:post][:content])
      redirect to "/posts/#{@post.id}"
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
      p params
      # @post = Post.find(params[:id])
      # @post.update_attributes(params[:post])
      # redirect to "/posts/#{@post.id}"
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

