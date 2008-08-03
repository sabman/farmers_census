class AdminMailer < ActionMailer::Base
  def survey_notification(survey, domain)  
    subject    = "[American-Farmer] Hey #{Admin::NAME}! a new survey was submitted!"
    setup_email(survey, domain, subject)
  end

  def nomination_notification(survey, domain)  
    subject = "[American-Farmer] Hey #{Admin::NAME}! a new nomination was submitted!"
    setup_email(survey, domain, subject) 
  end
        
  protected
    def setup_email(user, domain, subject)
      @subject    = subject
      @body       = {:user => Admin::NAME, :domain => domain} 
      @recipients = "#{Admin::EMAIL}" 
      @from       = "#{ActionMailer::Base.smtp_settings[:user_name]}"
      @sent_on    = Time.now
      @headers    = {}
    end
end
