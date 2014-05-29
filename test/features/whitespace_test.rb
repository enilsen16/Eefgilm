require "minitest/autorun"
require "eefgilm"

describe "Whitespace removal" do
  before do
    @file = "test/data/sources/dummy/Gemfile"
    FileUtils.copy "test/data/sources/original/railsgem", @file
    @worker = Eefgilm::Gemfile.new("test/data/sources/dummy")
  end
  it "should remove unnecessary whitespace" do
    @worker.clean!
   File.read(@file) {|f| f.read }.wont_match /(?<=^|\[)\s+|\s+(?=$|\])|(?<=\s)\s+/
  end
end
