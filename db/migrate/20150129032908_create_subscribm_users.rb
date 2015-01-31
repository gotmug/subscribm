class CreateSubscribmUsers < ActiveRecord::Migration
  def change
    create_table :subscribm_users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
