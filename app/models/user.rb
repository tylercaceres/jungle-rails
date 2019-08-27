class User < ActiveRecord::Base
  has_secure_password

  # before_filter :authorize

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}

  def self.authenticate_with_credentials(email,password)
    @user = User.find_by('lower(email)= ?', email.downcase.split)
    @user && @user.authenticate(password) ? @user : nil
  end

end
