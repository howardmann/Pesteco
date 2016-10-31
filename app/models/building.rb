# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :text
#  reports    :text             default([]), is an Array
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Building < ActiveRecord::Base
  belongs_to :client
  has_many :reports
end
