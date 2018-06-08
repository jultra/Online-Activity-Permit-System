class CreatePermits < ActiveRecord::Migration
  def self.up
    create_table :permits do |t|
      t.string :activity
      t.integer :venue
      t.integer :org_id
      t.string :date_needed
      t.string :date_end
      t.string :timefrom 
      t.string :timeto
      t.string :equipments
      t.integer :adviser
      t.string :osaStatus
      t.string :adviserStatus
      t.string :saoStatus
      t.string :facilityStatus
      t.timestamps null: false
    end

  end
  
  def self.down
    drop_table :permits
  end
end
