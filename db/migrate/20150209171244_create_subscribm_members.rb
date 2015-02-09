class CreateSubscribmMembers < ActiveRecord::Migration
  def change
    create_table :subscribm_members do |t|
      t.integer :account_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
