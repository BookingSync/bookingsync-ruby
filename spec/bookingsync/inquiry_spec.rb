require 'spec_helper'

describe BookingSync::Inquiry do
  subject { BookingSync::Inquiry.new(:id => 1) }

  it { should be_a_kind_of BookingSync::Inquiry }

  it_should_behave_like "a paginated class"
end