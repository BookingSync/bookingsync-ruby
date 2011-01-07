module BookingSync
  class Booking < Base
    include Pagination

    def rental
      Rental.find(rental_id)
    end
    
    def client
      Client.find(client_id) if client_id
    end
  end
end