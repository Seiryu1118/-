class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @review = Review.new
  end
  
  def index
    
  end
  
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path
    else
      render :new
    end
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path
    else
      render :edit
    end
  end
  
  private
  
  def review_params
    params.require(:review).permit(:name,:addresses,:menu,:introduction,:star,:image)
  end
end
