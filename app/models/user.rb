# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  			format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create
  #ask at one point, wherther I can continue to validate password and password_confirmation, on update, but allow password_reset to work
  has_one :common_app, dependent: :destroy


  has_one :video, dependent: :destroy

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column) # this is similar to create_remember_token, but instead it's generalized, so it can work on any column
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
