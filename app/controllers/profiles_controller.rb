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
    if @profile.update()
  end

end
