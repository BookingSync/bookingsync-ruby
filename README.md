# BookingSync (0.1.0)

## What is it?

This gem provides a set of classes to access information on [BookingSync][bs] via the published [API][api]:

    Booking, Client, Rental.

All these classes are inherited from ActiveResouce::Base. Refer to the [ActiveResouce][ar] documentation for more information.

## Installing

    gem install bookingsync

### Dependencies (see <code>bookingsync.gemspec</code> or run <code>bundle check</code>)

### Documentation

  I'm on [rdoc.info][rdoc]

### Configure your key
    
    require 'bookingsync'
    
    BookingSync::Base.user = 'api-auth-token'

If you are using this in a Rails application, putting this code in a config/initializers/bookingsync.rb
file is recommended. See config_initializers_bookingsync.rb in the examples/ directory.

## Usage

    @rental = BookingSync::Rental.create(:name => 'Wonderful Rental')
    
    @rentals = BookingSync::Rental.all
    
    @bookings = BookingSync::Booking.find_all_across_pages(:params => {:rental_id => 12345})
    
    @bookings = BookingSync::Rental.find(12345).bookings

## License

This code is free to be used under the terms of the [MIT license][mit].

## Bugs, Issues, Kudos and Catcalls

Comments are welcome. Send your feedback through the [issue tracker on GitHub][i]

If you have fixes: Submit via pull requests. Do not include version changes to the 
version file.

## Contributing to BookingSync
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Authors

* [Sébastien Grosjean][zencocoon]


[api]: http://www.bookingsync.com/en/documentation/api
[ar]: http://api.rubyonrails.org/classes/ActiveResource/Base.html
[bs]:  http://www.bookingsync.com
[rdoc]: http://rdoc.info/github/BookingSync/bookingsync-ruby/master/frames
[mit]:http://www.opensource.org/licenses/mit-license.php
[i]:  https://github.com/BookingSync/bookingsync-ruby/issues
[zencocoon]: https://github.com/ZenCocoon
