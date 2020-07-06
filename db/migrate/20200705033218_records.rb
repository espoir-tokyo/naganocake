class Records < ActiveRecord::Migration[5.2]
  def change
  	drop_table :admin_items
  	drop_table :admins_items
  end
end
