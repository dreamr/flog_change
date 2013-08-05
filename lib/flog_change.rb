require "flog_change/version"
require "flog_change/sample_cleaner"

module FlogChange
  class App
    def self.samples
      Dir["./samples/*.sample"]
    end
  end
end
