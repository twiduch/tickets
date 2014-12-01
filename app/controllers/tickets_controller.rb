class TicketsController < ApplicationController
  before_action :authorize_staff, only: :index
  
  def index
    @title = ticket_filter.title + ' tickets:'
    @tickets = ticket_filter.tickets
  end
  
  def new
    @ticket = Ticket.new
  end

  def show
    if @ticket = Ticket.find_by_ref(params[:id])
      @messages = @ticket.messages.includes(:author)
      @new_message = Message.new
      set_new_message
    else
      redirect_to root_url
    end
  end
  
  def create 
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      send_email_new_ticket
      redirect_to @ticket
    else
      render :new
    end
  end
  
  private
  
  def ticket_params
    params.require(:ticket).permit(:creator_name, :creator_email, :department,
                                   :subject, :body)
  end
  
  def ticket_filter
    TicketFilter.new(index_filter)
  end
  
  def index_filter
    params.fetch(:filter) {'unassigned'}
  end
  
  def set_new_message
    return unless logged_in?
    @new_message.new_status_id = Status.customer_waiting.first.id
    @new_message.new_owner_id = current_user.id
  end
  
  def send_email_new_ticket
    Thread.new {UserMailer.new_ticket(@ticket.creator_email, @ticket.ref, url_for(@ticket)).deliver}
  end
end
