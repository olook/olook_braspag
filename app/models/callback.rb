class Callback < ActiveRecord::Base
  attr_accessible :order_id, :payment_method, :status
end
