require "flog_change/version"

module FlogChange
  class App
    def self.sample_dir
      "./samples/*.sample"
    end

    def self.samples
      Dir[sample_dir]
    end
  end
end
