require 'flog_change'

module FlogChange
  module Flogged
    class Function
      attr_reader :score, :function_name
      def initialize(score, function_name)
        @score, @function_name = score, function_name
      end
    end
  end
end


