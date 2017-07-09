class ProductsController < ApplicationController
  def index
    @shoes = Product.all
    @purchases = Purchase.all.product

    @been_sold = []

    @shoes.each do |shoe|
      if Purchase.all.where("product_id=?", shoe.id).length==0
        @been_sold << shoe

      end
    end
    # # redirect_to
  end



  def create
    @user = User.find(session[:user_id])
    @shoes = Product.create(name: params[:name], price: params[:price],user: @user)

    if @shoes.valid?
    redirect_to :back
    else
      flash[:errors] = @events.errors.full_messages
      redirect_to :back
    end
  end

  def delete
    Product.find(params[:id]).destroy
    redirect_to :back
  end
end
