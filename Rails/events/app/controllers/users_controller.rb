class UsersController < ApplicationController
  def index
    session.clear();

  end

  def login
    @users = User.find_by_email(params[:email])

    if @users && @users.authenticate(params[:password])
      puts"^^^^^^^^inside the if for login"
      session[:user_id] = @users.id
      redirect_to "/events/"
    else
      puts"^^^^^^^^^^^ into else fro login"
      flash[:errors] = ["Invalid Login Information"]
      redirect_to :back
    end
  end

  def create
    @users = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    location: params[:location],
    state: params[:state],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )

    if @users.valid?
      puts"^^^^^^^^^^^ into if for create"

      session[:user_id] = @users.id
      redirect_to '/events/'
    else
      puts"^^^^^^^^^^^ into else for create"
      flash[:errors] = @users.errors.full_messages

      redirect_to :back
    end
  end

  def show
    @events=Event.find_by(params[:id])
  end

  def edit

  end

  def update
    puts'------------------------#########'
    @user = User.find(params[:id])
    puts'<<<<<<<---------######'
    @user.update_attributes(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    location: params[:location],
    state: params[:state]
    )

    if @user.valid?
      redirect_to '/events/'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
      puts'---------------->>>>>>>>>>>>>>'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
