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

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_category_path, notice: "作成できました"
    else
      render new_category_path, alert: "作成できませんでした"
    end
  end

  


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
