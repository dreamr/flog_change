require 'minitest_helper'
require 'flog_change/graph_generator'
require 'flog_change/sample'

require 'nokogiri'

describe FlogChange::GraphGenerator do
  subject { FlogChange::GraphGenerator }
  before do
    # stub out the sample directory
    #   so we dont blow away real data
    FlogChange::App.stubs(:sample_dir).returns("./test/tmp/*.sample")
    
    # copy in sample files
    `cp ./test/fixtures/samples/*.sample ./test/tmp/`
  end
  
  describe ".generate" do
    before do
      `rm ./tmp/index.html` if File.exist?("./tmp/index.html")
      subject.generate
      @content = File.open("./tmp/index.html") {|f| f.read}
    end

    it "must generate html file" do
      `ls ./tmp/index.html`.must_equal "./tmp/index.html\n"
    end

    it "must include the sample score" do
      node = Nokogiri::XML(@content)
      node.css('div#sample_score').text.must_equal("4939.0")
    end

    it "must include the method average" do
      node = Nokogiri::XML(@content)
      node.css('div#method_average').text.must_equal("8.5")
    end
  end
end

