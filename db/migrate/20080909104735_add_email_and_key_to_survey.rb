class AddEmailAndKeyToSurvey < ActiveRecord::Migration
  def self.up
    add_column :surveys, :email, :string
    add_column :surveys, :key, :string
  end

  def self.down
    remove_column :surveys, :key
    remove_column :surveys, :email
  end
end
