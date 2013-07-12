class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :path, null: false
      t.boolean :published, null: false, default: false
      t.datetime :published_at
      t.string :template
      t.string :heading, null: false
      t.text :body, null: false
    end

    add_index :pages, [:path], unique: true
  end
end
