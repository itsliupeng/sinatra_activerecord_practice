require File.expand_path '../spec_helper', __FILE__

describe "MyApp controller" do
  it "should get Listing posts" do
    get '/posts'
    last_response.body.must_include 'Listing posts'
  end

  it "should return OK" do
    # post '/posts'
    get '/posts'
    last_response.ok?
  end
end

