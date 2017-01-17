class Group < ActiveRecord::Base
  belongs_to :client
  has_many :buildings
end
