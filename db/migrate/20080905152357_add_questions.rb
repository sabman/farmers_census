class AddQuestions < ActiveRecord::Migration
  def self.up
    yaml_str = File.read("db/static/development/questions.yml" )
    objs = YAML::parse( yaml_str ).transform
    objs.each{|obj| obj.save}    
  end

  def self.down
    Question.delete_all
  end
end
