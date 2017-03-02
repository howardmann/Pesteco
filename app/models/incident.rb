class Incident < ActiveRecord::Base
  belongs_to :building
  belongs_to :user

  def send_incident_sighting
    UserMailer.sighting(self).deliver_now
  end
  
end
