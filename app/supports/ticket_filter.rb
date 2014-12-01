class TicketFilter
  VALUES = %w(unassigned open on_hold closed)
  
  def initialize(type)
    @type = type
  end
  
  def tickets
    @type.in?(VALUES) && Ticket.send(@type)
  end
  
  def title
    @type.humanize
  end
end
