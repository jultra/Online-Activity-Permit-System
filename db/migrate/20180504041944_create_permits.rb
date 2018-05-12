class CreatePermits < ActiveRecord::Migration
  def change
    create_table :permits do |t|
      t.string :activity
      t.string :venue
      t.string :organization
      t.string :date_needed
      t.string :time
      t.string :requisitioner

      t.timestamps null: false
    end
  end
end
