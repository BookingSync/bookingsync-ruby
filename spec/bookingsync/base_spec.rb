require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BookingSync::Base do
  it { subject.should be_a_kind_of ActiveResource::Base }

  describe "dynamic finder methods" do
    context "without pagination" do
      before do
        @rental_one = BookingSync::Base.new(:id => 1, :name => "A rental")
        @rental_two = BookingSync::Base.new(:id => 2, :name => "A rental")
        @rental_three = BookingSync::Base.new(:id => 3, :name => "Another rental")
        BookingSync::Base.should_receive(:find).with(:all).and_return([@rental_one, @rental_two, @rental_three])
      end

      it ".find_by_(attribute) finds one" do
        BookingSync::Base.find_by_name("A rental").should == @rental_one
      end

      it ".find_all_by_(attribute) finds all" do
        BookingSync::Base.find_all_by_name("A rental").should == [@rental_one, @rental_two]
      end
    end

    context "with pagination" do
      before do
        class PaginatedBaseClass < BookingSync::Base; include BookingSync::Pagination; end
        @john_doe = PaginatedBaseClass.new(:id => 1, :first_name => "John")
        @john_baker = PaginatedBaseClass.new(:id => 2, :first_name => "John")
        @joe_smith = PaginatedBaseClass.new(:id => 3, :first_name => "Joe")
        PaginatedBaseClass.should_receive(:find_all_across_pages).and_return([@john_doe, @john_baker, @joe_smith])
      end
      it ".find_by_(attribute) finds one" do
        PaginatedBaseClass.find_by_first_name("John").should == @john_doe
      end

      it ".find_all_by_(attribute) finds all" do
        PaginatedBaseClass.find_all_by_first_name("John").should == [@john_doe, @john_baker]
      end
    end

    it "expects arguments to the finder" do
      expect { BookingSync::Base.find_all_by_first_name }.to raise_error(ArgumentError)
    end

    it "falls back to regular method missing" do
      expect { BookingSync::Base.any_other_method }.to raise_error(NoMethodError)
    end
  end
end
