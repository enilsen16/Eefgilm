require "minitest/autorun"
require "eefgilm"
require "pry"
require "pry-nav"

describe "Comment processing" do
  before do
    FileUtils.copy "test/data/sources/original/railsgem", "test/data/sources/dummy/Gemfile"
    @gemfile = Eefgilm::Gemfile.new
  end

  it "must remove a files comments" do
    @gemfile.comment_removal.wont_match "/#/"
  end
end
