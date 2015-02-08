class AddBalanceInCentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balance_in_cents, :integer, default: 0
  end
end
