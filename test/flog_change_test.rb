require 'minitest_helper'
require 'flog_change'

describe FlogChange::App do
  subject { FlogChange::App }
  describe ".samples" do
    let(:time) {Time.now.to_i}
    before do
      # stub out the sample directory
      #   so we dont blow away real data
      FlogChange::App.stubs(:sample_dir).returns("./test/tmp/*.sample")

      # create a sample
      `touch ./test/tmp/#{time}.sample`
    end

    it "will return the sample file paths as an array" do
      subject.samples.must_include "./test/tmp/#{time}.sample"
    end
  end
end
