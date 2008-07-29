class AvatarController < ApplicationController
  def create
    @avatar = current_survey.build_avatar(params[:avatar])
    @avatar.save     
    redirect_to(stages_path)
  end
end
