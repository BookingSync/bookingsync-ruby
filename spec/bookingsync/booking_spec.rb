require 'spec_helper'

describe BookingSync::Booking do
  subject { BookingSync::Booking.new(:id => 1) }

  it { should be_a_kind_of BookingSync::Booking }

  it_should_behave_like "a paginated class"

  it "#rental should delegate to BookingSync::Rental" do
    subject.should_receive(:rental_id).at_least(1).times.and_return(1)
    BookingSync::Rental.should_receive(:find).with(1).and_return("rental")
    subject.rental.should == "rental"
  end

  describe "#client" do
    it "returns nil when it doesn't have a client" do
      subject.should_receive(:client_id).and_return(nil)
      subject.client.should be_nil
    end

    it "delegate to BookingSync::Client when it have a client_id" do
      subject.should_receive(:client_id).at_least(2).times.and_return(1)
      BookingSync::Client.should_receive(:find).with(1).and_return("client")
      subject.client.should == "client"
    end
  end
end