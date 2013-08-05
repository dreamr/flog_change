require 'flog_change'
require 'flog_change/flogged/file'

module FlogChange
  class Sample
    attr_reader :sample, :score, :method_average, :files
    def initialize(sample_path)
      @sample = File.open(sample_path) {|f| f.read}
      get_score
      get_method_average
      get_files
    end

  private
    
    def get_method_average
      @method_average = @sample.scan(/([0-9]+\.[0-9]+): flog\/method average/).flatten[0]
    end

    def get_score
      @score = @sample.scan(/([0-9]+\.[0-9]+): flog total/).flatten[0]
    end

    def get_files
      classes = @sample.scan(/[0-9]+\.[0-9]+: ([a-zA-Z]+) total/).flatten
      @files = classes.reject{|c| c == "flog" }.map {|c| ::FlogChange::Flogged::File.new(@sample, c)}
    end

  end
end

