module BookingSync
  class Rental < Base
    include Pagination

    def bookings
      Booking.find_all_across_pages(:from => "/rentals/#{id}/bookings.xml")
    end
  end
end