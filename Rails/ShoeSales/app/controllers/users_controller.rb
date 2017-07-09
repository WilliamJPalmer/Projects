class UsersController < ApplicationController
  def index

  end

  def show
    # @sold = Sell.all
    @sold_items = Purchase.all
    @sold_items.each do |sold|
      puts sold.product.user.first_name if sold.product.user == current_user
      puts ">>>>>>>>>>>>>>---------------->>^^>>^^>>^^>>"
      end

    @bought = Purchase.where('user_id=?', current_user.id)
    @myshoes = Product.where('user_id=?', current_user.id)
    @unsold = []
    @myshoes.each do |shoe|
      if Purchase.all.where("product_id=?", shoe.id).length==0
        @unsold << shoe

      end
    end
    @total = 0
    @total2= 0

  end

  def login
    @users = User.find_by_email(params[:email])

    if @users && @users.authenticate(params[:password])
      session[:user_id] = @users.id
      redirect_to "/shoes/"
    else
      flash[:errors] = ["Invalid Login Information"]
      redirect_to :back
    end
  end

  def create
    @users = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password]
    )

    if @users.valid?
      session[:user_id] = @users.id
      redirect_to '/shoes/'
    else
      flash[:errors] = @users.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
