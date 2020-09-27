class SchoolsController < ApplicationController
  include AjaxHelper
  before_action :sign_in_required, only: [:new]

  def index
    @search_params = school_search_params
    @schools = School.search(@search_params).order(created_at: "DESC").page(params[:page]).per(6)
    all_genre = School.pluck(:genre) + School.pluck(:subgenre)
    @genres = all_genre.uniq.reject(&:blank?)
    all_nation = School.pluck(:nation)
    @nations = all_nation.uniq.reject(&:blank?)
  end

  def show
    @school = School.find(params[:id])
    @reviews = @school.reviews.order(created_at: "DESC").page(params[:page]).per(4)
  end
  
  def new
    @school = School.all
    @user = User.last
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @school = School.new(      
      name: params[:name],
      address: params[:address],
      tell: params[:tell],
      latitude: params[:latitude],
      longitude: params[:longitude],
      image_url_a: params[:image_url_a],
      image_url_b: params[:image_url_b],
      detail: params[:detail],
      genre: params[:genre],
      subgenre: params[:subgenre],
      opentime: params[:opentime],
      res_id: params[:res_id],
      nation: params[:nation]
    )
    if @school.save
      puts "保存しました"
      respond_to do |format|
        format.js do
          render ajax_redirect_to(new_school_review_path(school_id: @school.id))
        end
      end
    else
      puts "すでに保存されてます"
      @sch = School.find_by(res_id: @school.res_id)
      respond_to do |format|
        format.js do
          render ajax_redirect_to(new_school_review_path(school_id: @sch.id))
        end
      end
    end
  end

  private

  def school_search_params
    params.fetch(:search, {}).permit(:name, :nation, :genre)
  end
end
