class AddColumnsToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :address, :string, null: false
    add_column :stores, :building_name, :string
    add_column :stores, :phone_number, :string, null: false
    add_column :stores, :bathing_fee, :integer, null: false
    add_column :stores, :prefecture_id, :integer, null: false
    add_column :stores, :rouryu_id, :integer, null: false
    add_column :stores, :outside_bath_id, :integer, null: false
    add_column :stores, :sauna_temp_id, :integer, null: false
    add_column :stores, :water_temp_id, :integer, null: false
  end
end
