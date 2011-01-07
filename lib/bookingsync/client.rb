module BookingSync
  class Client < Base
    include Pagination

    def bookings
      Booking.find_all_across_pages(:from => "/clients/#{id}/bookings.xml")
    end
  end
end