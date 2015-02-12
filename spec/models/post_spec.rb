require File.expand_path "../../spec_helper", __FILE__

require File.expand_path "../../../models/post", __FILE__

describe Post do
  before do
    @post = Post.new(title: "a", content: "aaa")
  end

  it "should validate title" do

  end

  it "should have attributes title and content" do
    @post.title.must_equal "a"
    @post.content.must_equal "aaa"
  end

end



