require 'spec_helper'

describe BookingSync::Client do
  subject { BookingSync::Client.new(:id => 1) }

  it { should be_a_kind_of BookingSync::Client }

  it_should_behave_like "a paginated class"

  it "#bookings" do
    BookingSync::Booking.should_receive(:find_all_across_pages).with(:from=>"/clients/1/bookings.xml").and_return("bookings")
    subject.bookings.should == 'bookings'
  end
end