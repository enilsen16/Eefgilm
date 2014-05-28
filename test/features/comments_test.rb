require "minitest/autorun"
require "eefgilm"
require "pry"
require "pry-nav"

describe "Comment processing" do
  before do
    @file = "test/data/sources/dummy/Gemfile"
    FileUtils.copy "test/data/sources/original/railsgem", @file
    @worker = Eefgilm::Gemfile.new("test/data/sources/dummy")
  end

  it "must remove a files comments" do
    @worker.remove_comments!
    File.read(@file) {|f| f.read }.wont_match /#(.*)$/
  end
end
