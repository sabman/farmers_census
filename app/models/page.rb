class Page < ActiveRecord::Base
  after_update "YamlHelper::write_to_yaml(self.class)"
end
