module Eefgilm
  class Gemfile
    attr_accessor :path, :lines, :source, :group

    def initialize(path = ".", options = {})
      @path  = path
      @lines = []
      @options = {
        :alphabetize => true,
        :delete_whitespace => true,
        :delete_comments => true
      }.merge(options)
    end

    def clean!
      # Extract:
      extract_to_array_of_lines

      # Transform:
      change_double_qoutes_to_single if @options[:alphabetize]
      delete_comments! if @options[:delete_comments]
      delete_whitespace! if @options[:delete_whitespace]
      alphabetize_gems! if @options[:alphabetize]

      # Load:
      recreate_file
    end

    private

    def extract_to_array_of_lines
      gemfile = File.open("#{@path}/Gemfile", "r+")

      file_lines = gemfile.readlines
      file_lines.each do |line|
        self.source = line if line.match(/^source/)
        group       = line.match(//) if line.match(/^\s*group/)
        self.lines << line if line.match(/^\s*gem/)
      end
    end

    def change_double_qoutes_to_single
      @lines.each do |line|
        line.gsub!('"',"'")
      end
    end

    def delete_comments!
      @lines.each do |string|
        string.gsub!(/#(.*)$/, "")
      end
    end

    def recreate_file
      output = File.open( "#{@path}/Gemfile", "w+" )
      output.puts @source
      output.puts

      @lines.each do |line|
        unless line.empty?
          output.puts line
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
