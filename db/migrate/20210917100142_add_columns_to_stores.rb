class AddColumnsToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :sauna_temp, :integer, null: false
    add_column :stores, :water_temp, :integer, null: false
    add_column :stores, :rouryu_id, :integer, null: false
    add_column :stores, :outside_bath_id, :integer, null: false
    add_column :stores, :break_space_id, :integer, null: false
    add_column :stores, :bathing_fee, :integer, null: false
    add_column :stores, :prefecture_id, :integer, null: false
    add_column :stores, :address, :string, null: false
    add_column :stores, :phone_number, :string, null: false
  end
end
