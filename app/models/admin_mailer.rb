class AdminMailer < ActionMailer::Base
  def survey_notification(survey, domain)  
#    setup_email(user, domain)
    @subject    = "[American-Farmer] Hey #{Admin::NAME}! a new survey was submitted!"
    @body       = {:user => Admin::NAME, :domain => domain} 
    @recipients = "#{Admin::EMAIL}"
    @from       = "#{ActionMailer::Base.smtp_settings[:user_name]}"
    @sent_on    = Time.now
    @headers    = {}
  end
  
  
  protected
    def setup_email(user, domain)
      @subject    = "[American-Farmer] Hey #{Admin::NAME}! a new survey was submitted!"
      @body       = {:user => Admin::NAME, :domain => domain} 
      @recipients = "#{Admin::NAME}"
      @from       = "#{ActionMailer::Base.smtp_settings[:user_name]}"
      @sent_on    = Time.now
      @headers    = {}
    end
end
