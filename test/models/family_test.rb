require "test_helper"

describe Family do
  before do
    @family = Family.new
  end

  it "must be valid" do
    @family.valid?.must_equal true
  end
end
