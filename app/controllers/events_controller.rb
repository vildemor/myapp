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
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)

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
  end

  private
  def event_params
    params.require(:event).permit(:title, :text)
  end

end