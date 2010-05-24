class CreateMazes < ActiveRecord::Migration
  def self.up
    create_table :mazes do |t|
      t.string :title
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :mazes
  end
end
