class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :execution_id
      t.string :place
      t.integer :fee
      t.datetime :start_time
      t.references :user,         null: false,foreign_key: true
      t.timestamps
    end
  end
end
