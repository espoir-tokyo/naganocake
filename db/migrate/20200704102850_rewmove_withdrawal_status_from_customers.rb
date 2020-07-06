class RewmoveWithdrawalStatusFromCustomers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :customers, :withdrawal_status, :boolean
  end
end
