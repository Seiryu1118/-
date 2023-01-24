class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
   def index
     @customers = Customer.page(params[:page])
   end

   def show
     @customer = Customer.find(params[:id])
   end 
   
   def edit
     @customer = Customer.find(params[:id])
   end

   def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     flash[:notice] = "情報の変更が完了しました."
     redirect_to admin_customer_path
    else
     flash[:alret] = "変更の保存に失敗しました"
     render :edit
    end
   end

 private
  def customer_params
   params.require(:customer).permit(:name, :email, :sex, :is_deleted)
  end
end