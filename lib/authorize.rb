require 'rubygems'
require 'cbraspag'

gateway = Braspag::Connection.new(
  :merchant_id => '{540BA6EE-39D7-3DC1-D87D-7F82C49A3598}',
  :environment => :homologation
)

# The card verification value is also known as CVV2, CVC2, or CID
credit_card = Braspag::CreditCard.new(
  :holder_name        => 'Bob Bobsen',
  :number             => '0000000000000001',
  :month              => '8',
  :year               => '2012',
  :verification_value => '123'
)

customer = Braspag::Customer.new(
  :name => 'Bob Dela Bobsen'
)

order = Braspag::Order.new(
  :payment_method    => Braspag::PAYMENT_METHOD[:braspag],
  :id                => 1234567,
  :amount            => '1000', # $10.00 (accepts all amounts as Integer values in cents)
  :customer          => customer,
  :installments      => 1,
  :installments_type => Braspag::INTEREST[:no]
)

# Validating the card automatically detects the card type
if credit_card.valid?(:authorize) && customer.valid?(:authorize) && order.valid?(:authorize)
  # Authorize $10 from the credit card
  response = gateway.authorize(order, credit_card)

  if response.success?
    puts "Successfully authorized $#{sprintf("%.2f", order.amount / 100)} to the credit card #{order.gateway_id}"
  else
    raise StandardError, response.message
  end
end
