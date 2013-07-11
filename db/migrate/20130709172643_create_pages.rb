class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :path, null: false
      t.boolean :published, null: false, default: false
      t.datetime :published_at
      t.string :heading, null: false
      t.text :body, null: false
    end
  end
end
