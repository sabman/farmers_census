namespace :db do
  namespace :questions do    
    desc 'Create YAML dump from questions in an existing database.  
    Defaults to development database.  Set RAILS_ENV to override.'
    task :dump => :environment do
      file = File.open("#{RAILS_ROOT}/db/questions.yml", 'w+') 
      ActiveRecord::Base.establish_connection(RAILS_ENV)
      questions = Question.find(:all, :select => 'id, qtype, text, title_label, stage_id', :include => :options)
      file.write questions.inject({}) { |hash, rec|
        if rec.qtype == "options" or rec.qtype == "list" or rec.qtype == "yes_no" 
          opts_hash = rec.options.inject({}){ |h, opt| h["options_#{opt.id}"] = {"text", opt.text, "filename", opt.filename}; h }
          hash["question_#{rec.id}"] = {"qtype", rec.qtype, "text", rec.text, "title_label", rec.title_label, "stage_id", rec.stage_id, "options", opts_hash}
        else
          hash["question_#{rec.id}"] = {"qtype", rec.qtype, "text", rec.text, "title_label", rec.title_label, "stage_id", rec.stage_id}
        end
        hash
      }.sort.to_yaml         
      file.close
    end
  end
end
