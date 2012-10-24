require 'rubygems'
require 'cbraspag'
gateway = Braspag::Connection.new(
  :merchant_id => '{540BA6EE-39D7-3DC1-D87D-7F82C49A3598}',
  :environment => :homologation
)
credit_card = Braspag::CreditCard.new(
  :holder_name        => 'Bob Bobsen',
  :number             => '1111222233334444',
  :month              => '8',
  :year               => '2012',
  :verification_value => '123'
)
customer = Braspag::Customer.new(
  :name => 'Bob Dela Bobsen'
)
order = Braspag::Order.new(
  :payment_method    => Braspag::PAYMENT_METHOD[:braspag],
  :id                => 10144,
  :amount            => 10.00, # $10.00 (accepts all amounts as Integer values in cents)
  :customer          => customer,
  :installments      => 1,
  :installments_type => Braspag::INTEREST[:no]
)
if credit_card.valid?(:purchase) && customer.valid?(:purchase) && order.valid?(:purchase)
  response = gateway.purchase(order, credit_card)
  if response.success?
    puts "Successfully charged $#{sprintf("%.2f", order.amount / 100)} to the credit card #{order.gateway_id}"
  else
    raise StandardError, response.message
  end
end
