require "minitest/autorun"
require "eefgilm"


describe "Alphabetize your gemfile" do
  before do
    @file = "test/data/sources/dummy/Gemfile"
    FileUtils.copy "test/data/sources/original/original2", @file
    @worker = Eefgilm::Gemfile.new("test/data/sources/dummy")
  end

  it "should Alphabetize each gem in your gemfile" do
    @worker.clean!
    @worker.lines.must_equal @worker.lines.sort
  end
end
