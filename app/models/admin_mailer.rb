class AdminMailer < ActionMailer::Base     
  
  def key_reminder(survey, domain)
    subject = "[American-Farmer] Your Survey"
    setup_email(survey.email, domain, subject, survey.email)
    @body.merge!({:key => survey.key})
  end 
  
  def survey_notification(survey, domain)  
    subject    = "[American-Farmer] Hey #{Admin::NAME}! a new survey was submitted!"
    setup_email(Admin::NAME, domain, subject, Admin::EMAIL)
  end

  def nomination_notification(survey, domain)  
    subject = "[American-Farmer] Hey #{Admin::NAME}! a new nomination was submitted!"
    setup_email(Admin::NAME, domain, subject, Admin::EMAIL) 
  end
        
  protected
    def setup_email(user, domain, subject, email)
      @subject    = subject
      @body       = {:user => user, :domain => domain} 
      @recipients = email 
      @from       = "#{ActionMailer::Base.smtp_settings[:user_name]}"
      @sent_on    = Time.now
      @headers    = {}
    end
end
