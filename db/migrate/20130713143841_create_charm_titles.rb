class CreateCharmTitles < ActiveRecord::Migration
  def change
    create_table :charm_titles do |t|
      t.string :path, null: false
      t.string :value, null: false
    end

    add_index :charm_titles, [:path], unique: true
  end
end
