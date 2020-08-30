class StaticPagesController < ApplicationController
  def start
    if user_signed_in?
      redirect_to root_path
    else
      @reviews = Review.order(created_at "DESC").page(params[:page]).per(5)
    end
  end

  
end
