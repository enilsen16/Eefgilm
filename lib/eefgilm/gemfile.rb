module Eefgilm
  class Gemfile
    attr_accessor :path, :lines

    def initialize(path= "./")
      @path = path
    end

    def extract_to_array_of_lines
      gemfile = File.open("#{@path}/Gemfile", "r+")
      @lines = gemfile.readlines
    end

    def remove_comments!
      # #extract
      extract_to_array_of_lines

      # #transform
      delete_comments

      # #load
      recreate_file
    end

    def delete_comments
      @lines.each do |string|
        string.gsub!(/#(.*)$/, "")
      end
    end

    def recreate_file
      output = File.open( "#{@path}/Gemfile", "w+" )
      @lines.each do |line|
        unless line.empty?
          output << line
        end
      end
      output.close
    end
  end
end

