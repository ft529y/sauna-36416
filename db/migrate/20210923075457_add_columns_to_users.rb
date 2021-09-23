class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :my_area, :string
    add_column :users, :period_id, :integer, null: false
    add_column :users, :introduce, :text, null: false
  end
end
