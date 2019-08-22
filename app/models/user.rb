class User < ActiveRecord::Base

  has_secure_password

  # before_filter :authorize

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  # validates :password_digest, presence: true

end
