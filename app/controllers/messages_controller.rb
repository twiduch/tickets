class MessagesController < ApplicationController
  def create
    send_email_update if build_message and logged_in?
    update_ticket
    redirect_to ticket
  end
  
  private
  
  def message 
    @message ||= Message.new(message_params)
  end
  
  def message_params
    params.require(:message).permit(:body, :ticket_id)
  end
  
  def ticket 
    @ticket ||= Ticket.find(params[:message][:ticket_id])
  end
  
  def build_message
    message.author = current_user
    message.prev_status = ticket.status
    message.prev_owner = ticket.owner
    message.save
  end
  
  def update_ticket
    ticket.status = new_status
    ticket.owner = new_owner if logged_in?
    ticket.save
  end
  
  def send_email_update
    Thread.new {UserMailer.staff_response(ticket.creator_email, ticket.ref, url_for(ticket), message.body).deliver}
  end
  
  def new_status
    logged_in? ? Status.find(params[:message][:new_status_id]) : Status.staff_waiting.first
  end
  
  def new_owner 
    User.find(params[:message][:new_owner_id])
  end
  
end
