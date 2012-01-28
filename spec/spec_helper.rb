require 'bookingsync'

BookingSync::Base.user = ENV['BOOKINGSYNC_USER'] || 'x'

require 'bookingsync/pagination_behavior'

RSpec.configure do |config|
  config.color_enabled = true
end
