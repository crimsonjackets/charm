# This migration comes from charm (originally 20130709172643)
class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :parent_id
      t.string :slug, null: false
      t.boolean :published, null: false, default: false
      t.datetime :published_at
      t.string :heading, null: false
      t.text :body, null: false
    end
  end
end
