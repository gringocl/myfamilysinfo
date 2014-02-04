require "test_helper"

describe Relationship do
  before do
    @relationship = Relationship.new
  end

  it "must be valid" do
    @relationship.valid?.must_equal true
  end
end
