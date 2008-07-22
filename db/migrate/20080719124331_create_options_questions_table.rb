class CreateOptionsQuestionsTable < ActiveRecord::Migration
  def self.up
    create_table :options_questions, :force => true, :id => false  do |t|
      t.integer :question_id
      t.integer :option_id
    end
  end

  def self.down
    drop_table :options_questions
  end
end
