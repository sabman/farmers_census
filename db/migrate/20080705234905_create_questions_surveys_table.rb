class CreateQuestionsSurveysTable < ActiveRecord::Migration
  def self.up
    create_table :questions_surveys, :force => true, :id => false  do |t|
      t.integer :survey_id
      t.integer :question_id
    end
  end

  def self.down
    drop_table :questions_surveys
  end
end
