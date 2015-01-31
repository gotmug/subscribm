class AddSubdomainToSubscribmAccounts < ActiveRecord::Migration
  def change
    add_column :subscribm_accounts, :subdomain, :string
    add_index :subscribm_accounts, :subdomain
  end
end
