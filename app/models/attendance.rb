class Attendance < ApplicationRecord
  after_create :event_participe

  belongs_to :participant, class_name: "User"
  belongs_to :event

  validates :stripe_customer_id, uniqueness:true

  def event_participe #un utilisateur a participer a un evenement
    UserMailer.event_participe(self).deliver_now
  end
end
