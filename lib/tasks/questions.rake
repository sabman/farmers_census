namespace :db do
  namespace :questions do    
    desc 'Create YAML dump from questions in an existing database.  
    Defaults to development database.  Set RAILS_ENV to override.'
    task :dump => :environment do
      file = File.open("#{RAILS_ROOT}/db/questions.yml", 'w+') 
      ActiveRecord::Base.establish_connection(RAILS_ENV)
      questions = Question.find(:all, :select => 'id, qtype, text, title_label, stage_id', :include => :options)
      file.write questions.inject({}) { |hash, rec|
        if rec.qtype == "options" or rec.qtype == "list"
          opts_hash = rec.options.inject({}){ |h, opt| h["options_#{opt.id.to_s.rjust(3).gsub(/ /,"0")}"] = {"text", opt.text, "filename", opt.filename}; h }
          hash["question_#{rec.id.to_s.rjust(3).gsub(/ /,"0")}"] = {"qtype", rec.qtype, "text", rec.text, "title_label", rec.title_label, "stage_id", rec.stage_id, "options", opts_hash}
        else
          hash["question_#{rec.id.to_s.rjust(3).gsub(/ /,"0")}"] = {"qtype", rec.qtype, "text", rec.text, "title_label", rec.title_label, "stage_id", rec.stage_id}
        end
        hash
      }.sort.to_yaml         
      file.close
    end

    desc 'Load questions into database from YAML dump. Defaults to development database.  Set RAILS_ENV to override.'
    task :load => :environment do
      questions_yaml = YAML.load(File.read("#{RAILS_ROOT}/db/questions.yml") )
      ActiveRecord::Base.establish_connection(RAILS_ENV)      
      questions_yaml.each do |question|
        q_attrs = {"text", question[1]["text"], "qtype", question[1]["qtype"], "text", question[1]["text"], "title_label", question[1]["title_label"], "stage_id", question[1]["stage_id"]}
        if stage = Stage.find(question[1]["stage_id"])
          q = Question.create(q_attrs)
          if q.qtype == 'options' or q.qtype == 'list'
            question[1]["options"].each_value{ |v| 
							q.options << Option.create(v) 
						}
          elsif q.qtype == 'yes_no'
            opts = [Option.create(:text => "yes", :filename => "/images/labels/yes.png"), Option.create(:text => "no", :filename => "/images/labels/no.png")]
            q.options << opts
          end
          q.save
        else 
          return "Stage #{stage_id} not found"
        end        
      end
    end    
  end
end
