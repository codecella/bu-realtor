class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :house_name
      t.string :house_address
      t.string :house_info

      t.timestamps null: false
    end
  end
end
