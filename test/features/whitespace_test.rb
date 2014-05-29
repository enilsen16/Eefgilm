
require "eefgilm"

describe "Whitespace removal" do
  before do
    @file = "test/data/sources/dummy/Gemfile"
    FileUtils.copy "test/data/sources/original/railsgem", @file
    @worker = Eefgilm::Gemfile.new("test/data/sources/dummy")
  end
  it "should remove unnecessary whitespace" do
    regex = /(?<=^|\[)\s+|(?<=\s)\s+/
    count = 0
    @worker.clean!
    File.read(@file).each_line do |line|
      count += 1 if regex.match(line)
    end
    count.must_equal 2
  end
end
