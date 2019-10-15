class ReviewsController < ApplicationController
  before_action :find_information
  before_action :find_review, only: [:edit,:update, :destroy]
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.information_id = @information.id
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to information_path(@information)
    else
      reder 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    
    if @review.update(review_params)
      redirect_to information_path(@information)
    else
      render 'edit'
    end
  end
  
  def destroy
    @review.destroy
    redirect_to information_path(@information)
  end
  
  private
  
  def review_params
    params.require(:review).permit(:comment)
  end
  
  def find_information
    @information = Information.find(params[:information_id])
  end
  
  def find_review
    @review = Review.find(params[:id])
  end
end
