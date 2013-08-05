require 'erb'
require 'flog_change'

module FlogChange
  class GraphGenerator
    def self.generate(sample)
      content   = File.read("./erb/index.html.erb")
      @sample   = sample
      renderer  = ERB.new(content)
      File.open("./tmp/index.html", "w") {|f| f.puts(renderer.result(binding)) }
    end
  end
end

