class SchoolsController < ApplicationController

  def index
    @schools = School.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def show
    @schools = Sshool.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    
  end
end
