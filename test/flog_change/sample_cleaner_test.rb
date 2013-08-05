require 'minitest_helper'
require 'flog_change/sample_cleaner'

describe FlogChange::SampleCleaner do
  subject { FlogChange::SampleCleaner }

  let(:timings) {[Time.now, Time.now+1]}
  before do
    # stub out the sample directory
    #   so we dont blow away real data
    FlogChange::App.stubs(:sample_dir).returns("./test/tmp/*.sample")

    # create some samples
    for time in timings
      filename = "#{FlogChange::App.sample_dir.gsub("/*.sample","")}/#{time.to_i}.sample"
      `touch #{filename}`
    end
  end

  after do
    `rm ./test/tmp/*.sample`
  end

  describe ".clean" do
    it "Will only keep the last sample" do
      subject.clean
      FlogChange::App.samples.must_equal ["./test/tmp/#{timings[1].to_i}.sample"]
    end
  end

  describe ".old_timestamps" do
    it "will return all the samples but the newest" do
      subject.old_timestamps.must_equal [timings[0].to_i.to_s]
    end
  end

end
