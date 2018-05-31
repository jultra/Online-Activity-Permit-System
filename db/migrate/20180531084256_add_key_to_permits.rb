class AddKeyToPermits < ActiveRecord::Migration
  def change
    add_column :permits, :key, :string
  end
end
