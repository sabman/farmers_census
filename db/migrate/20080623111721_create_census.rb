class CreateCensus < ActiveRecord::Migration
  def self.up
    create_table :census do |t|
      t.string :title
      
      t.timestamps
    end
  end

  def self.down
    drop_table :census
  end
end
