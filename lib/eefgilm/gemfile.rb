module Eefgilm
  class Gemfile
    attr_accessor :path, :source, :groups

    def initialize(path = ".", options = {})
      @path  = path
      @groups ={}
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
      group_block = :all
      file_lines = gemfile.readlines

      file_lines.each do |line|
        self.source = line if line.match(/^source/)

        if line.match(/^\s*group/)
          group_block = line.match(/^group (:.*)[,|\s]/)[1]
        elsif line.match(/^\s*end/)
          group_block = :all
        end

        if line.match(/^\s*gem/)
          if self.groups[group_block].nil?
            self.groups[group_block] = [line]
          else
            self.groups[group_block] << line
          end
        end
      end
    end

    def change_double_qoutes_to_single
      @groups.each do |group, gems|
        @groups[group] = gems.map do |g|
          g.gsub('"',"'")
        end
      end
    end

    def delete_comments!
      @groups.each do |group, gems|
        @groups[group] = gems.map do |g|
          g.gsub(/#(.*)$/, "")
        end
      end
    end

    def recreate_file
      output = File.open( "#{@path}/Gemfile", "w+" )
      output.puts @source
      output.puts

      @groups.each do |group, gems|
        if group == :all
          gems.each do |g|
            output.puts g
          end
        else
          output.puts
          output.puts "group #{group}"

          gems.each do |g|
            output.puts "  #{g}"
          end
          output.puts "end"
        end
      end

      output.close
    end

    def alphabetize_gems!
      @groups.each do |group, gems|
        @groups[group] = gems.sort
      end
    end

    def delete_whitespace!
      @groups.each do |group, gems|
        @groups[group] = gems.map do |g|
          g.gsub(/(?<=^|\[)\s+|\s+(?=$|\])|(?<=\s)\s+/, "")
        end
      end
    end
  end
end
