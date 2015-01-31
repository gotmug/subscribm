class CreateSubscribmAccounts < ActiveRecord::Migration
  def change
    create_table :subscribm_accounts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
