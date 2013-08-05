require 'minitest_helper'
require 'flog_change/graph_generator'

describe FlogChange::GraphGenerator do
  subject { FlogChange::GraphGenerator }
  before do
    # stub out the sample directory
    #   so we dont blow away real data
    FlogChange::App.stubs(:sample_dir).returns("./test/tmp/*.sample")

  end
  describe ".generate" do

  end
end

