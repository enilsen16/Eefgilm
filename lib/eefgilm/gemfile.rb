module Eefgilm
  class Gemfile
    attr_accessor :path, :source, :groups, :rubyversion

    def initialize(path = '.', options = {})
      @path  = path
      @groups = {}
      @options = { alphabetize: true,
                   delete_whitespace: true,
                   delete_comments: true }.merge(options)
    end

    def clean!
      extract_to_array_of_lines

      clean each_gem double_qoutes_to_single! if @options[:alphabetize]
      clean each_gem delete_comments!         if @options[:delete_comments]
      clean each_gem delete_whitespace!       if @options[:delete_whitespace]
      clean alphabetize!                      if @options[:alphabetize]

      recreate_file
    end

    private

    # Cleaning Operations #######################################
    def alphabetize!
      lambda(&:sort)
    end

    def double_qoutes_to_single!
      substitute('"', "'")
    end

    def delete_comments!
      substitute(/#(.*)$/, '')
    end

    def delete_whitespace!
      substitute(/(?<=^|\[)\s+|\s+(?=$|\])|(?<=\s)\s+/, '')
    end

    # DSL Utilities #############################################
    def clean(block)
      @groups.each do |group, gems|
        @groups[group] = block[gems]
      end
    end

    def each_gem(block)
      ->(gems) { gems.map { |e| block[e] } }
    end

    def substitute(a, b)
      ->(str) { str.gsub(a, b) }
    end

    # Read and Write Gemfile ##################################
    def extract_to_array_of_lines
      groups[group_block = :all] = []

      File.open("#{@path}/Gemfile", 'r+').each do |line|
        case line = line.strip.chomp
        when /^source/
          self.source = line
        when /^ruby/
          self.rubyversion = line
        when /^\s*group/
          group_block = line.match(/^group (:.*)[,|\s]/)[1]
          groups[group_block] ||= []
        when /^\s*end/
          group_block = :all
        end
        groups[group_block] << line if line.match(/^\s*gem/)
      end
    end

    def recreate_file
      output = [@source, @rubyversion, ''].compact
      @groups.each do |group, gems|
        if group == :all
          output << gems.map(&:to_s)
        else
          output << "\ngroup #{group}"
          output << gems.map { |g| "\s\s#{g}" }
          output << 'end'
        end
      end
      save_gemfile(output.flatten.join("\n"))
    end

    def save_gemfile(output)
      f = File.open("#{@path}/Gemfile", 'w')
      f.write(output)
      f.close
    end
  end
end
