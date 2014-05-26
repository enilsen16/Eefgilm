require "minitest/autorun"

 describe "The Gemfile behaves correctly" do
  it "The Gemfile can be read correctly" do
    gemfile = Contents.new
    gemfile.must_include "source 'https://rubygems.org'"
  end
end
