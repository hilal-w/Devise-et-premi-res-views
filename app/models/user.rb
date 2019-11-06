class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :user_created_compte

  has_many :admin_event, foreign_key: 'admin_id', class_name: 'Event'
  has_many :participant_event, foreign_key: 'participant_id', class_name: 'Event'
  has_many :attendances
  has_many :events, through: :attendances

  validates :first_name, presence: true, length: {minimum: 3 }
  validates :last_name, presence: true, length: {minimum: 3 }
  validates :description, presence: true, length: {in: 20..500 }

#a chaque fois qu'un user est crée
#en lui envoi un email de bienvenue
  def user_created_compte
    UserMailer.user_created_compte(self).deliver_now
  end

end
