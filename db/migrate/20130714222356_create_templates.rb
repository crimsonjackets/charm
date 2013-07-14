class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :method, null: false, default: 'get'
      t.string :path, null: false
      t.string :format, null: false, default: 'html'
      t.string :file, null: false
    end

    add_index :templates, [:method, :path, :format], unique: true
  end
end
