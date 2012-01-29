# BookingSync [![Build Status](http://travis-ci.org/BookingSync/bookingsync-ruby.png)](http://travis-ci.org/BookingSync/bookingsync-ruby)

## What is it?

This gem provides a set of classes to access information on [BookingSync][bs] via the published [API][api]:

    Booking, Client, Rental.

All these classes are inherited from ActiveResouce::Base. You can refer to the [ActiveResouce][ar] documentation for more information.

## Installing

    gem install bookingsync

or within a Rails 3 application

    gem "bookingsync"

### Dependencies

This gem depends on ActiveResource 3.x

### Documentation

Further documentation can be found on [rdoc.info][rdoc].

### Configure your key

    require 'bookingsync'

    BookingSync::Base.user = 'api-auth-token'

If you are using this in a Rails application, putting this code in a `config/initializers/bookingsync.rb`
file is recommended. See `config_initializers_bookingsync.rb` in the `examples/` directory.

## Usage

    @rental = BookingSync::Rental.create(:name => 'Wonderful Rental')

    @rentals = BookingSync::Rental.all

    @bookings = BookingSync::Booking.find_all_across_pages(:params => {:rental_id => 12345})

    @bookings = BookingSync::Rental.find(12345).bookings

## License

This code is free to be used under the terms of the [MIT license][mit].

## Authors

* [Sébastien Grosjean][zencocoon]


[api]: http://www.bookingsync.com/en/documentation/api
[ar]: http://api.rubyonrails.org/classes/ActiveResource/Base.html
[bs]:  http://www.bookingsync.com
[rdoc]: http://rdoc.info/github/BookingSync/bookingsync-ruby/master/frames
[mit]:http://www.opensource.org/licenses/mit-license.php
[i]:  https://github.com/BookingSync/bookingsync-ruby/issues
[zencocoon]: https://github.com/ZenCocoon
