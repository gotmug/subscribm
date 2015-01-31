class AddOwnerIdToSubscribmAccounts < ActiveRecord::Migration
  def change
    add_column :subscribm_accounts, :owner_id, :integer
  end
end
