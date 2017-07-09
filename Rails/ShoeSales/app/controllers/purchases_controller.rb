class PurchasesController < ApplicationController

  def index
  end

  def create
    @shoe = Product.find(params[:id])
    @purchaser = User.find(session[:user_id])
    # prod = Product.find(params[:id])
    @seller = @shoe.user
    puts ">>>>>>>>>>.------------------>>>>>>>>"
    puts @seller

    Purchase.create(user: @purchaser, product: @shoe)

    Sell.create(user: @shoe.user, product: @shoe)

    redirect_to :back
  end


end
