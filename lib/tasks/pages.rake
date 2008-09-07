namespace :db do
  namespace :pages do

    desc 'Dump pages into the db/pages.yml'
    task :dump => :environment do
      ActiveRecord::Base.establish_connection(RAILS_ENV)
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
      ActiveRecord::Base.establish_connection(RAILS_ENV)      
      pages_yaml.each do |page_yaml|
        Page.create(page_yaml[1])
      end
    end  
    
  end       
end