require 'minitest_helper'
require 'flog_change/sample_cleaner'

describe FlogChange::SampleCleaner do
  subject { FlogChange::SampleCleaner }

  let(:timings) {[Time.now, Time.now+1]}
  before do
    # create some samples
    for time in timings
      `touch ./samples/#{time.to_i}.sample`
    end
  end

  after do
    `rm ./samples/*.sample`
  end

  describe ".clean" do
    it "Will only keep the last sample" do
      subject.clean
      FlogChange::App.samples.must_equal ["./samples/#{timings[0].to_i}.sample"]
    end
  end

  describe ".old_timestamps" do
    it "will return all the samples but the newest" do
      subject.old_timestamps.must_equal [timings[1].to_i.to_s]
    end
  end

end
