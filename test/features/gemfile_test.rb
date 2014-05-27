require "minitest/autorun"
require "eefgilm"

describe "Gemfile" do
  it "The Gemfile can be read correctly" do
    gemfile = Eefgilm::Gemfile.new
    contentarray= gemfile.read
    source = "source 'https://rubygems.org'"
    contentarray.first.chomp.must_equal source
  end

  it "will raise an exception if methods are called without a specified Gemfile" do
    gemfile = Eefgilm::Gemfile.new("../data/no_gemfile")
    proc { gemfile.read }.must_raise(Errno::ENOENT)
  end
end
