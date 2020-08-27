class ProfilesController < ApplicationController
  before_action :validate_user, only: [:edit, :update]

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "更新しました"
      redirect_to profile_path(id: @profile.id)
    else
      flash.now[:alert] = " 更新に失敗しました"
      render :edit
    end
  end

  

end
