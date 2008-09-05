class AddStages < ActiveRecord::Migration
  def self.up    
    yaml_str = File.read("db/static/development/stages.yml" )
    objs = YAML::parse( yaml_str ).transform
    objs.each{|obj| obj.save}    
  end

  def self.down
    Stage.delete_all
  end
end
