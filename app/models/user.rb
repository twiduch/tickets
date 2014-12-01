class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, class_name: 'Role', dependent: :destroy, through: :user_roles
  has_many :tickets
  
  validates :username, uniqueness: { case_sensitive: false }, presence: true,
                       length: { maximum: 30 }
  validates :password, length: { minimum: 6 }
  validates :first_name, presence: true
  
  after_initialize :defaults
  before_save { self.username = username.downcase }
  has_secure_password
  
  private
  
  def defaults
    self.roles << Role.staff if new_record?
  end
end
