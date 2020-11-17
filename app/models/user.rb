class User < ActiveRecord::Base

  has_secure_password

  # Returns an instance of the user if authenticated or nil otherwise

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.downcase.strip).try(:authenticate, password)
    if @user
      @user
    else
      nil
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
