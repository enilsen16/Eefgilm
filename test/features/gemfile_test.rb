require "test_helper"

describe "Gemfile" do
  it "will raise an exception if methods are called without a specified Gemfile" do
    gemfile = Eefgilm::Gemfile.new("../data/sources/")
    proc { gemfile.clean! }.must_raise(Errno::ENOENT)
  end

  describe "Comment Proccessing" do
    before do
      @file = "test/data/sources/dummy/Gemfile"
      FileUtils.copy "test/data/sources/original/railsgem", @file
      @worker = Eefgilm::Gemfile.new("test/data/sources/dummy")
    end

    it "must remove a files comments" do
      @worker.clean!.wont_match /.../
      #File.read(@file) {|f| f.read }.wont_match /#(.*)$/
    end

    it "should Alphabetize each gem in your gemfile" do
      @worker.clean!
      @worker.lines.must_equal @worker.lines.sort
    end

    it "should remove unnecessary whitespace" do
      regex = /(?<=^|\[)\s+|(?<=\s)\s+/
      count = 0
      @worker.clean!
      File.read(@file).each_line do |line|
        count += 1 if regex.match(line)
      end
      count.must_equal 1
    end
  end
end
