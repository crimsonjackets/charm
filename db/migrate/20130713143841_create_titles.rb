class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :path, null: false
      t.string :value, null: false
    end
  end
end
