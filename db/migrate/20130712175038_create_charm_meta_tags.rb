class CreateCharmMetaTags < ActiveRecord::Migration
  def change
    create_table :charm_meta_tags do |t|
      t.string :path, null: false
      t.binary :data, null: false, default: "\\x04087b00"
    end
  end
end
