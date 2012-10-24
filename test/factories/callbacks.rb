# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :callback do
    order_id "MyText"
    status "MyText"
    payment_method "MyText"
  end
end
