class SearchController < ApplicationController

  def create
    @title = 'Found tickets:'
    @tickets=Ticket.search(params[:search][:body]).records
    
    render :template => "tickets/index"
  end
end
