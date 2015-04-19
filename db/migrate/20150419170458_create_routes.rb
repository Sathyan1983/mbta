class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :agency_id, null: false
      t.string :obid, null: false
      t.string :long_name
      t.string :short_name
      t.string :description

      t.timestamps null: false
    end

    add_index :routes, :obid, unique: true
  end
end
