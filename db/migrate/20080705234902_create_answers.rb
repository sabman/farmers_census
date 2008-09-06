class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :text
      t.integer :question_id
      t.integer :survey_id
      t.integer :farm_id
      t.integer :stage_id

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
