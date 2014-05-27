module Eefgilm
  class Gemfile
    attr_accessor :path

    def initialize(path= "./")
      @path = path
    end

    def read
     gemfile = File.open("#{@path}/Gemfile", "r")
     file = gemfile.readlines
     return file
    end
  end
end
