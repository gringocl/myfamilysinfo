require "test_helper"

describe Record do
  before do
    @record = Record.new
  end

  it "must be valid" do
    @record.valid?.must_equal true
  end
end
