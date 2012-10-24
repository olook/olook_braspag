class CreateCallbacks < ActiveRecord::Migration
  def change
    create_table :callbacks do |t|
      t.text :order_id
      t.text :status
      t.text :payment_method

      t.timestamps
    end
  end
end
