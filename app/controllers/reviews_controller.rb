class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :find_school, only: [:show, :new, :edit, :create, :update]
  before_action :sign_in_required, only: [:new, :edit]
  before_action :validate_user, only:[:edit, :update, :destroy]

  def index
    @reviews = Review.all.order(created_at: "DESC").page(params[:page]).per(6)
  end

  def show
    @comment = Comment.new 
    @comments = @review.comments.page(params[:page]).per(5)
  end

  def new
    @review = Review.new
    @review.review_images.build
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.school_id = @school.id
    if @review.save
      flash[:notice] = "口コミを作成できました"
      redirect_to school_review_path(id: @review.id)
    else
      flash.now[:alert] = "口コミの作成に失敗しました。詳細はタイトル入力欄上のエラーメッセージをご確認ください。"
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to school_review_path(id: @review.id), notice: "更新できました"
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
      redirect_to school_review_path(id: @review.id)
    end
  end

  def search
    if params[:search].blank?
      redirect_back fallback_location: root_path, notice: "検索キーワードを入力"
    else
      @reviews = Review.search(params[:search]).order(created_at: "DESC").page(params[:page]).per(3)
    end
  end
  
  private

  def find_review
    @review = Review.find(params[:id])
  end

  def find_school
    @school = School.find(params[:school_id])
  end

  def review_params
    params.require(:review).permit(:title, :body, :tag_list, review_images_images: [], category_ids: []) 
  end

  def validate_user
    @review = Review.find(params[:id])
    if @review.user != current_user
      flash[:alert] = "無効なURLです"
      redirect_back(fallback_location: school_review_path)
    end
  end
end
