require 'flog_change'
require 'flog_change/flogged/function'

module FlogChange
  module Flogged
    class File
      attr_reader :sample, :class_name, :score, :functions
      def initialize(sample, class_name)
        @sample, @class_name = sample, class_name
        get_score
        get_functions
      end

    private

      def get_score
        @score = @sample.scan(/([0-9]+\.[0-9]+): #{class_name} total/).flatten[0]
      end

      def get_functions
        function_scores = @sample.scan(/([0-9]+\.[0-9]+): #{class_name}#([a-z_])+/).flatten
        @functions = function_scores.map {|s,m| ::FlogChange::Flogged::Function.new(m,s)}
      end
    end
  end
end

