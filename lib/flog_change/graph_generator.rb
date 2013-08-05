require 'erb'
require 'flog_change'

module FlogChange
  class GraphGenerator
    def self.generate
      content     = File.read("./erb/index.html.erb")
      samples     = FlogChange::App.samples
      @last_sample, @this_sample = FlogChange::Sample.new(samples[0]),
                                   FlogChange::Sample.new(samples[1])
      renderer  = ERB.new(content)
      File.open("./tmp/index.html", "w") {|f| f.puts(renderer.result(binding)) }
    end
  end
end

