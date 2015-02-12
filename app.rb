require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/reloader' if development?

# require File.expand_path '../models/post', __FILE__
require_relative 'models/post'
# require File.expand_path '../config/database', __FILE__
# require_relative 'config/database'


class MyApp < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    use Rack::MethodOverride

    get '/posts' do
      p params
      @posts = Post.all
      erb :"index.html"
    end

    post '/posts' do
      p params
      @post = Post.create!(title: params[:post][:title], content: params[:post][:content])
      redirect to "/posts/#{@post.id}"
    end

    get '/posts/new' do
      p params
      @post = Post.new
      erb :"new.html"
    end

    get '/posts/:id' do
      p params
      @post = Post.find(params[:id])
      erb :"show.html"
    end

    get '/posts/:id/edit' do
      p params
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
      p params
      @post = Post.find(params[:id])
      @post.destroy!
      redirect to "/posts"
    end
end

