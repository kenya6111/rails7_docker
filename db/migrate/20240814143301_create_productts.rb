class CreateProductts < ActiveRecord::Migration[7.0]
  def change
    create_table :productts do |t|
      t.string :name
      t.integer :price
      t.string :vendor

      t.timestamps
    end
  end
end
