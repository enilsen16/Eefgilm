module Eefgilm
  class Gemfile
    attr_accessor :path

    def initialize(path= "./")
      @path = path
      @lines = []
    end

    def read
      gemfile = File.open("#{@path}/Gemfile", "r+")
      @file = gemfile.readlines
    end

    def remove_comments!
      #extract
      extract_to_array_of_lines

      #transform
      delete_comments

      #load
      recreate_file
    end

    def extract_to_array_of_lines
      # given a gemfile

      # iterate through it

      # put each line into @lines
    end

    def delete_comments
      # go through each item in @lines

      # for every line with a hash

      # delete everything from the right on
      # the_line.gsub(/pattern/, '')

    end

    def recreate_file

      # go through each item in the @lines

      # put each item in @lines on new line in file

      #or join everything into a string and write that all at once  \n


    end
  end
end

