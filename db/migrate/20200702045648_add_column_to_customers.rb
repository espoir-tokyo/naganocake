class AddColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	add_column :customers, :surname, :string
  	add_column :customers, :first_name, :string
  	add_column :customers, :surname_kana, :string
  	add_column :customers, :first_name_kana, :string
  	add_column :customers, :postal_code, :string
  	add_column :customers, :address, :text
  	add_column :customers, :phone_number, :string
  	add_column :customers, :withdrawal_status, :boolean
  end
end
