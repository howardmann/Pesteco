# == Schema Information
#
# Table name: reports
#
#  id          :integer          not null, primary key
#  date        :date
#  pdf         :text
#  building_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Report < ActiveRecord::Base
  belongs_to :building
  validates :pdf, presence: true
  validates :date, presence: true
end
