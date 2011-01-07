require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BookingSync::Rental do
  subject { BookingSync::Rental.new(:id => 1) }
  
  it { should be_a_kind_of BookingSync::Rental }

  it_should_behave_like "a paginated class"

  it "#bookings" do
    BookingSync::Booking.should_receive(:find_all_across_pages).with(:from=>"/rentals/1/bookings.xml").and_return("bookings")
    subject.bookings.should == 'bookings'
  end
end