class SurveySweeper < ActionController::Caching::Sweeper
  observe Survey

  def after_save(survey)
    expire_cache(survey)
  end

  def after_destroy(survey)
    expire_cache(survey)
  end

  private

    def expire_cache(survey)
      expire_page( :controller => 'front_page', :action => 'index') 
      expire_page( :controller => 'front_page', :action => 'show' ) 
      # (0..Survey.count-1).each do |i|
      #   expire_page( :controller => 'surveys', :action => 'show', :id => i ) 
      # end
      expire_page( :controller => 'surveys', :action => 'show', :id => survey.id ) 
    end

end