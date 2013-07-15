class CreateCharmTemplates < ActiveRecord::Migration
  def change
    create_table :charm_templates do |t|
      t.string :path, null: false
      t.string :file, null: false
    end

    add_index :charm_templates, [:path], unique: true
  end
end
