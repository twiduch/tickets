class Message < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :author, class_name: 'User'
  belongs_to :prev_status, class_name: 'Status'
  belongs_to :prev_owner, class_name: 'User'
  
  validates_presence_of :ticket, :prev_status
  attr_accessor :new_status_id, :new_owner_id
  
  default_scope {order(:created_at)}
end
