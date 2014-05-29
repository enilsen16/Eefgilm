module Eefgilm
  class Gemfile
    attr_accessor :path, :lines, :source, :group

    def initialize(path = ".")
      @path  = path
      @lines = []
    end

    def extract_to_array_of_lines
      gemfile = File.open("#{@path}/Gemfile", "r+")

      file_lines = gemfile.readlines
      file_lines.each do |line|
        self.source = line if line.match(/^source/)
        group       = line.match(//) if line.match(/^\s*group/)
        self.lines << line if line.match(/^\s*gem/)
      end
    end

    def clean!
      # Extract:
      extract_to_array_of_lines

      # Transform:
      delete_comments!
      delete_whitespace!
      alphabetize_gems!

      # Load:
      recreate_file
    end

    def delete_comments!
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

    def alphabetize_gems!
      @lines.sort!
    end

    def delete_whitespace!
      @lines.each do |line|
        line.gsub!(/(?<=^|\[)\s+|\s+(?=$|\])|(?<=\s)\s+/, "")
      end
    end
  end
end

