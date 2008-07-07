class CreateStages < ActiveRecord::Migration
  def self.up
    create_table :stages do |t|
      t.string :title
      t.string :title_label
      
      t.timestamps
    end
  end

  def self.down
    drop_table :stages
  end
end
