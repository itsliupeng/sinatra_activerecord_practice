# require File.expand_path '../spec_helper', __FILE__
require_relative 'spec_helper'


describe "MyApp controller" do
  before do
    @post = @post || Post.create!(title: "a", content: "aaa")
  end

  after do
    @post.destroy if @post
  end

  it "get '/posts should return OK" do
    get '/posts'
    last_response.ok?
  end

  it "get '/posts/new should return OK" do
    get '/posts/new'
    last_response.ok?
  end

  it "get /posts/:id should return ok" do
    get "/posts/#{@post.id}"
    last_response.ok?
  end

  it "get /posts/:id/edit should return ok" do
    get "/posts/#{@post.id}/edit"
    last_response.ok?
  end

  it "post /posts should return ok" do
    post "/posts", {post: {title: "test_a", content: "test_aaa"}}
    last_response.ok?
  end

  it "put /posts/:id should return ok" do
    put "/posts/#{@post.id}", {post: {title: "test_a", content: "test_aaa"}}
    last_response.ok?
  end

  it "delete /posts/:id should return ok" do
    delete "/posts/#{@post.id}"
    last_response.ok?
  end

end

