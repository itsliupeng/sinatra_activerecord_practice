require File.expand_path '../spec_helper', __FILE__

describe "my example app" do
  it "should successfully return a greeting" do
    get '/posts'
    last_response.body.must_include 'Listing posts'
  end

  it "should return OK" do
    get '/posts'
    last_response.ok?
  end
end

