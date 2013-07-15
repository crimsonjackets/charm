class CreateCharmAccounts < ActiveRecord::Migration
  def change
    create_table :charm_accounts do |t|
      t.string :type, null: false, default: 'User'
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :name, null: false
    end

    add_index :charm_accounts, [:email], unique: true
  end
end
