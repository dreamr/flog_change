require 'minitest_helper'
require 'flog_change/sample'

describe FlogChange::Sample do
  subject { FlogChange::Sample.new(sample_path) }
  let(:sample_path) { "./test/tmp/1375688092.sample" }
  before do
    `cp ./test/fixtures/samples/*.sample ./test/tmp/`
  end

  describe "#score" do
    it { subject.score.must_equal "4939.0" }
  end

  describe "#method_average" do
    it { subject.method_average.must_equal "8.5" }
  end

  describe "#files" do
    it { subject.files.count.must_equal 56 }
  end
end
