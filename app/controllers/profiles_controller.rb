class ProfilesController < ApplicationController
  before_action :validate_user, only: [:edit, :update]

  
end
