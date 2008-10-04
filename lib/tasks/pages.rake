namespace :db do
  namespace :pages do

    desc 'Dump pages into the db/pages.yml'
    task :dump => :environment do
      pages = Page.find(:all, :select => "id, name, permalink, content, label")
      File.open("#{RAILS_ROOT}/db/pages.yml", 'w+') do |file|        
        file.write pages.inject({}) { |hash, page|
          hash["page_#{page.id.to_s.rjust(3).gsub(/ /,"0")}"] = {"name", page.name, "permalink", page.permalink, "content", page.content, "label", page.label}; hash
        }.sort.to_yaml
      end
    end  
    
    desc 'Load pages into the database from db/pages.yml'
    task :load => :environment do
      pages_yaml = YAML.load(File.read("#{RAILS_ROOT}/db/pages.yml") )
      i = "000"
      pages_yaml.each do |page_yaml|
        begin # update
          p = Page.find(i.succ!.to_i)  
          p.update_attributes(page_yaml[1])          
        rescue ActiveRecord::RecordNotFound # create
          p = Page.create(page_yaml[1])          
        end
      end
    end  
    
  end       
end