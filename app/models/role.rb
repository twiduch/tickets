class Role < ActiveRecord::Base
  before_destroy {false}
  has_many :user_roles
  has_many :users, class_name: 'User', dependent: :destroy, through: :user_roles
  
  validates :name, uniqueness: true, presence: true
  
  scope :admin, -> { where(name: 'admin')}
  scope :staff, -> { where(name: 'staff')}
end
