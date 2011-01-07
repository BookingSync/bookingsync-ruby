if Rails.env != 'test'
  BookingSync::Base.user = 'my_fancy_auth_token'
end