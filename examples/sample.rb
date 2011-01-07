require 'bookingsync'
require 'pp'

BookingSync::Base.user = 'xxx'

rentals = BookingSync::Rental.all

pp rentals