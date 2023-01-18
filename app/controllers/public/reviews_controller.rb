class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!, except: [:index,:show]

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @type = Type.all
    @soup = Soup.all
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to review_path(@review.id)
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
      redirect_to reviews_path(@review.id)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:name,:address,:menu,:introduction,:rate,:image,:type_id,:soup_id)
  end
end
