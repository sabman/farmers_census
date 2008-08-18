class AvatarController < ApplicationController
  def create
    @avatar = Avatar.new(params[:avatar])
    @avatar.save     
    current_survey.avatars << @avatar
    redirect_to(stages_path)
  end
end
