class TicketsController < ApplicationController

  def index

  end

  def create
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.create(ticket_params)
    flash[:notice] = "Ticket booking confirmed"
    new_available_tickets = @event.available_tickets - 1
    new_tickets_sold = @event.tickets_sold + 1
    @event.update(available_tickets: new_available_tickets, tickets_sold: new_tickets_sold)
    redirect_to event_path(@event)
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to events_path
    else
      render 'shared/error_messages'
    end

    def destroy
      @ticket = Ticket.find(params[:id])
      @ticket.destroy

      redirect_to tickets_path
    end


  end
  private
  def ticket_params
    params.require(:ticket).permit(:user_id, :event_id)
  end
end
