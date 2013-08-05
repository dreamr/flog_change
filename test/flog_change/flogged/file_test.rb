require 'minitest_helper'
require 'flog_change/flogged/file'

describe FlogChange::Flogged::File do
  subject { FlogChange::Flogged::File.new(sample, "ReportsHelper") }
  let(:sample) { File.open("./test/tmp/1375688092.sample") {|f| f.read} }
  before do
    `cp ./test/fixtures/samples/*.sample ./test/tmp/`
  end
  
  describe "#class_name" do
    it { subject.class_name.must_equal "ReportsHelper" }
  end

  describe "#score" do
    it { subject.score.must_equal "330.3" }
  end

  describe "#functions" do
    it { subject.functions.count.must_equal 24 }
  end

end
