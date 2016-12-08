class EventsController < ApplicationController

  def index
    @events = Event.all
      if params[:search]
        @events = Event.search(params[:search]).order("created_at DESC")
      else
        @events = Event.all.order('created_at DESC')
      end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @user = User.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.tickets_sold = 0
    if logged_in?
      @event.host_id = current_user.id
    end
    if @event.save
      redirect_to @event
    else
      render 'new'
      end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :text, :start_date, :start_time, :location, :category, :available_tickets, :tickets_sold, :user_id)
  end

end