class LikesController < ApplicationController
  before_action :sign_in_required
    def create
      @review = Review.find(params[:review_id])
    end

    def destroy
      @review = Like.find(params[:id]).review
    end
end
