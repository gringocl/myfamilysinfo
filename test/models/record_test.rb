require "test_helper"

describe Reminder do
  before do
    @reminder= Reminder.new
  end

  it "must be valid" do
    @reminder.valid?.must_equal true
  end
end
