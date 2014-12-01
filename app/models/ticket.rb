class Ticket < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :owner, class_name: 'User'
  belongs_to :status
  has_many :messages
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :creator_email, presence: true, length: { maximum: 255 },
                            format: { with: VALID_EMAIL_REGEX }
                    
  validates_presence_of :creator_name, :subject, :body
  after_initialize :defaults
  
  scope :unassigned, -> { where(owner: nil)}
  scope :open, -> { where(status: [Status.staff_waiting.first, Status.customer_waiting.first]).
                    where.not(owner: nil)}
  scope :on_hold, -> { where(status: Status.on_hold)}
  scope :closed, -> { where(status: [Status.completed.first, Status.cancelled.first])}

  def to_param
    ref
  end
  
  private
  
  def defaults
    return unless new_record?
    self.status = Status.staff_waiting.first
    self.ref = UniqueReference.generate
  end
end
