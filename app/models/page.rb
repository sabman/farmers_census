class Page < ActiveRecord::Base
  after_save "YamlHelper::write_to_yaml(self.class)"
end
