namespace :db do
  namespace :questions do    
    desc 'Create YAML dump from questions in an existing database.  
    Defaults to development database.  Set RAILS_ENV to override.'
    task :dump => :environment do
      file = File.open("#{RAILS_ROOT}/db/questions.yml", 'w+') 
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
      i = "000"
      questions_yaml.each do |question|
        q_attrs = 
        {     
          "text",         question[1]["text"], 
          "qtype",        question[1]["qtype"], 
          "text",         question[1]["text"], 
          "title_label",  question[1]["title_label"], 
          "stage_id",     question[1]["stage_id"]          
        }                                            
        if stage = Stage.find(question[1]["stage_id"]) 
          begin # update 
            q = Question.find(i.succ!.to_i) 
            # are we updating qtype from a non-options question to yes-no?
            if q.qtype != "yes_no" and (q.qtype != "options" or q.qtype != "list") and q_attrs["qtype"] == "yes_no"
              q.options << [  Option.create(:text => "yes", :filename => "/images/labels/yes.png"), 
                              Option.create(:text => "no",  :filename => "/images/labels/no.png")  ]              
              q.save
            end
            if q.qtype == "yes_no" and q.options.empty?
              q.options << [  Option.create(:text => "yes", :filename => "/images/labels/yes.png"), 
                              Option.create(:text => "no",  :filename => "/images/labels/no.png")  ]              
              q.save              
            end              
            q.update_attributes(q_attrs)           
            # TODO: updating options not supported at the moment 
          rescue ActiveRecord::RecordNotFound # create
            q = Question.create(q_attrs)    
            if q.qtype == 'options' or q.qtype == 'list'
              question[1]["options"].each_value{ |v| q.options << Option.create(v) }
            elsif q.qtype == 'yes_no'
              q.options << [  Option.create(:text => "yes", :filename => "/images/labels/yes.png"), 
                              Option.create(:text => "no",  :filename => "/images/labels/no.png")  ]
            end
          end
          q.save
        else 
          return "Stage #{stage_id} not found"
        end        
      end
    end    
  end
end
