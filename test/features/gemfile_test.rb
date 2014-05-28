require "minitest/autorun"
require "eefgilm"

describe "Gemfile" do
  it "The Gemfile can be read correctly" do
    gemfile = Eefgilm::Gemfile.new
    contentarray = gemfile.extract_to_array_of_lines
    source = "source 'https://rubygems.org'"
    contentarray.first.chomp.must_equal source
  end

  it "will raise an exception if methods are called without a specified Gemfile" do
    gemfile = Eefgilm::Gemfile.new("../data/sources/")
    proc { gemfile.extract_to_array_of_lines }.must_raise(Errno::ENOENT)
  end
end
