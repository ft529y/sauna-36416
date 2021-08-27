class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :store_name,         null: false
      t.text :description,          null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
