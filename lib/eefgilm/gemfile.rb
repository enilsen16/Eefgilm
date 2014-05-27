module Eefgilm
  class Gemfile
    attr_accessor :path

    def initialize(path= "./")
      @path = path
    end

    def read
     gemfile = File.open("#{@path}/Gemfile", "r+")
     @file = gemfile.readlines
   end

  #  def comment_removal
  #   @file.
  end
end
