# FIXME: unchecking all options doesn't send back any params

class AnswersController < ApplicationController
  before_filter :verify_admin
  
  def toggle_public
    ans = Answer.find(params[:id])
    ans.public = ans.public? ? false : true
    ans.save
    render :nothing => true
  end
  
end
