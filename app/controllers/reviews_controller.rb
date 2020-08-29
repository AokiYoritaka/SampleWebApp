class ReviewsController < ApplicationController
  before_action :validate_user, only:[:edit, :update, :destroy]
  def index
    @reviews = Review.all.order(created_at: "DESC").page(params[:page]).per(5)
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @reviews.user_id = current_user.id
    @review.school_id = @school.id
     if @review.save
      flash[:notice] = "作成できました"
      redirect_to restaurant_review_path(id: @review.id)
    else
      flash.now[:alert] = "作成に失敗しました。"
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to restaurant_review_path(id: @review.id), notice: "更新できました"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_to root_path, notice: "削除に成功しました"
    else
      flash[:alert] = "削除に失敗しました。"
      redirect_to restaurant_review_path(id: @review.id)
    end
  end

  private

  def validate_user
    @review = Review.find(params[:id])
    if @review.user != current_user
      flash[:alert] = "無効なURLです"
      redirect_back(fallback_location: restaurant_review_path)
    end
  end
end
