class Group < ActiveRecord::Base
  belongs_to :client
  has_many :buildings
  has_many :reports, through: :buildings
  has_many :users, through: :buildings
end
