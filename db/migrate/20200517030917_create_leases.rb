class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.string :name
      t.integer :phone
      t.integer :payment

      t.timestamps null: false
    end
  end
end
