require 'minitest_helper'
require 'flog_change/flogged/function'

describe FlogChange::Flogged::Function do
  subject { FlogChange::Flogged::Function.new("24.0", "some_function_here") }

  describe "#function_name" do
    it { subject.function_name.must_equal "some_function_here" }
  end

  describe "#score" do
    it { subject.score.must_equal "24.0" }
  end

end

