class SchoolsController < ApplicationController

  def index
    @schools = School.order(created_at: "DESC").page(params[:page]).per(10)
  end

  
end
