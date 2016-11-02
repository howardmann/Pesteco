# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :text
#  name            :string
#  mobile          :string
#  admin           :boolean          default(FALSE)
#  client_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  belongs_to :client
  has_many :buildings, through: :client

  validates :email, uniqueness: true

  # Generates random token, check if any other user has this token otherwise create new
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64(8)
    end while User.exists?(column => self[column])
  end

  # Generate random token and store in user column :password_reset_token, also set current time of rest in column :password_reset_sent_at. Then save user and call on the ActionMailer method password_reset in file app/mailers/user_mailer.rb
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end

  def send_password_welcome
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.welcome(self).deliver_now
  end
end
