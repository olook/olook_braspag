require 'rubygems'
require 'cbraspag'

gateway = Braspag::Connection.new(
  :merchant_id => '{540BA6EE-39D7-3DC1-D87D-7F82C49A3598}',
  :environment => :homologation
)

order = Braspag::Order.new(
  :id => 11254
)

# Capture $10 from the credit card
response = gateway.capture(order)

if response.success?
  puts "Successfully charged #{order.id}"
else
  raise StandardError, response.message
end
