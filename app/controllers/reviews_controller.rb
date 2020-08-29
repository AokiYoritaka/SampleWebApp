class ReviewsController < ApplicationController
  def index
    @reviews = Review.all.order(created_at: "DESC").page(params[:page]).per(5)
  end
  
end
