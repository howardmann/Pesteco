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
  has_and_belongs_to_many :users
  has_many :reports
  belongs_to :group
  has_many :incidents

  def incidentsDone
    self.incidents.order('date_report DESC').select do |el|
      el.date_respond
    end
  end

  def incidentsTodo
    self.incidents.order('date_report DESC').select do |el|
      !el.date_respond
    end
  end
end
