# This migration comes from charm (originally 20130711131025)
class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :type, null: false, default: 'User'
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :name, null: false
    end

    add_index :accounts, [:email], unique: true
  end
end
