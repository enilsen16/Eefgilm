require "minitest/autorun"
require "eefgilm"

describe "Whitespace removal" do
  before do
    @file = "test/data/sources/dummy/Gemfile"
    FileUtils.copy "test/data/sources/original/railsgem", @file
    @worker = Eefgilm::Gemfile.new("test/data/sources/dummy")
  end
  it "should remove empty lines with new line character" do
    @worker.delete_whitespace!
    @worker.wont_match /^\n/
  end
end

