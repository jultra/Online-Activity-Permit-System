class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room
      t.integer :in_charge

      t.timestamps null: false
    end
  end
end
