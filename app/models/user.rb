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
end
