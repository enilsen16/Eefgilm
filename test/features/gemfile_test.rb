require "minitest/autorun"
require "eefgilm"

 describe "Gemfile" do
  it "The Gemfile can be read correctly" do
    gemfile = Eefgilm::Gemfile.new
    contentarray= gemfile.read
    source = "source 'https://rubygems.org'"
    contentarray.first.chomp.must_equal source
  end
  it "checks to see if a gemfile is present" do
    gemfile = File.exist?(File.join(File.dirname(__FILE__), "../data/default_gemfile/Gemfile"))
    gemfile.must_equal true
  end
  it "does not have a gemfile" do
    gemfile = File.exist?(File.join(File.dirname(__FILE__), "../data/no_gemfile/Gemfile"))
    gemfile.must_equal false
  end
end
