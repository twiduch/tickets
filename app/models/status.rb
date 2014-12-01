class Status < ActiveRecord::Base
  before_destroy {false}
  has_many :tickets
  
  validates :name, uniqueness: true, presence: true
  
  scope :staff_waiting, -> { where(name: 'Waiting for Staff Response')}
  scope :customer_waiting, -> { where(name: 'Waiting for Customer')}
  scope :on_hold, -> { where(name: 'On Hold')}
  scope :cancelled, -> { where(name: 'Cancelled')}
  scope :completed, -> { where(name: 'Completed')}
end
