class EventsController < ApplicationController
  def index
    @users = current_user
    @events = Event.all

    @state_events = Event.where('state=?', current_user.state)
    # @state_events.each do |event|
    #   puts event.user
    #   puts'----------------------------'
    # end
    # the state=? is used to get the events with the same state as the current_user. The ? usis a variable and the current_user.state is the value of the ?
    # @users = current_user
    @outtastate = Event.where.not('state=?',current_user.state)
    puts @outtastate
  end

  def new
  end

  def create
    @user = User.find(session[:user_id])

    # event = Event.find(id=:id)
    @events = Event.create(
      name: params[:name],
      location: params[:location],
      state:  params[:state],
      date: params[:date],
      user: @user
      )

    if @events.valid?
    redirect_to "/events/"
    else
      flash[:errors] = @events.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @events = Event.find(params[:id])
    @comments = Comment.all
    @attending = Participate.where(event: @events)
    # @attending = Participate.where(event_id: params[:id])
  end

def join
  event = Event.find(params[:id])
  user = User.find(session[:user_id])
  Participate.create(user: user, event: event)
  redirect_to :back
end
def cancel
  Participate.find_by(user_id: session[:user_id], event_id: params[:id]).destroy
  redirect_to :back
end
# def delete
#   Event.find(params[:id]).destroy
#   redirect_to :back
# end
def update
  @event = Event.find(params[:id])
  puts"***********************************"
  puts params[:id]
  puts @event
  puts"***********************************"
  @event.update_attributes(
  name: params[:name],
  date: params[:date],
  location: params[:location],
  state: params[:state],
  )

  if @event.valid?
    redirect_to '/events'
  else
    flash[:errors] = @event.errors.full_messages
    redirect_to :back
  end
end


def edit
  @event = Event.find(params[:id])
  puts"+++++++++++++++++++++++++++++++++++++"
  puts params[:id]
  puts @event
  puts"+++++++++++++++++++++++++++++++++++++"

end


  def destroy
    Event.find(params[:id]).destroy
    redirect_to :back
  end
end
