require 'minitest_helper'
require 'flog_change'

describe FlogChange::FlogChange do
  subject { FlogChange::FlogChange }
  describe ".samples" do
    let(:time) {Time.now.to_i}
    before do
      # create a sample
      `touch ./samples/#{time}.sample`
    end

    it "will return the sample file paths as an array" do
      subject.samples.must_include "./samples/#{time}.sample"
    end
  end
end
