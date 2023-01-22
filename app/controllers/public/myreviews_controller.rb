class Public::MyreviewsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @review = Review.where(customer_id: current_customer.id).includes(:customer).order("created_at DESC")
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to myreviews_path
  end

end
