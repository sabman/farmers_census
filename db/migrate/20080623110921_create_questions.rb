class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :text
      t.string :list
      t.string :qtype
      t.integer :stage_id
      t.integer :census_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
