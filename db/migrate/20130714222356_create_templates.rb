class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :path, null: false
      t.string :file, null: false
    end

    add_index :templates, [:path], unique: true
  end
end
