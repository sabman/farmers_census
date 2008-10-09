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
      expire_page(:controller => 'front_page', :action => 'index') 
      expire_page(:controller => 'front_page', :action => 'show') 
    end

end