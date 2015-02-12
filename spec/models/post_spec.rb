require File.expand_path "../../spec_helper", __FILE__

require File.expand_path "../../../models/post", __FILE__

describe Post do
  before do
    @post = @post || Post.new(title: "a", content: "aaa")
    @post1 = @post1 || Post.new(title: "", content: "aaa")
  end

  after do
    @post.destroy if @post
    @post1.destroy if @post1
  end

  it "should be a Post" do
    @post.must_be_instance_of Post
  end

  it "should validate title" do
    @post.invalid?.must_equal false
    @post1.invalid?.must_equal true
  end

  it "should have attributes title and content" do
    @post.title.must_equal "a"
    @post.content.must_equal "aaa"
  end

end



