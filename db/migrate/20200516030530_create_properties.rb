class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :apttype
      t.string :description
      t.integer :price
      t.integer :user_id
      t.string :address
      t.string :status

    end
  end
end
