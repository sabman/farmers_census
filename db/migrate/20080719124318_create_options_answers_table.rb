class CreateOptionsAnswersTable < ActiveRecord::Migration
  def self.up
    create_table :answers_options, :force => true, :id => false  do |t|
      t.integer :answer_id
      t.integer :option_id
    end
  end

  def self.down
    drop_table :answers_options
  end
end
