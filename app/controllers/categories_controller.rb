class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @reviews = @category.reviews.order(created_at: "DESC").page(params[:page]).per(3)
  end

  def new
    @categories = Category.all
    @category = Category.new
  end
end
