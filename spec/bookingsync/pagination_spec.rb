require 'spec_helper'

describe BookingSync::Pagination do
  class TestClass < BookingSync::Base; include BookingSync::Pagination; end
  subject { TestClass.new }
  
  it_should_behave_like "a paginated class"
end