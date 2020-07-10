class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.string :ship_postal_code
      t.string :ship_address
      t.string :ship_name
      t.integer :bill
      t.integer :carriage
      t.integer :payment_informantion
      t.integer :order_status

      t.timestamps
    end
  end
end
