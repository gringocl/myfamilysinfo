require "test_helper"

describe Kid do
  before do
    @kid = Kid.new
  end

  it "must be valid" do
    @kid.valid?.must_equal true
  end
end
