class Event < ApplicationRecord

  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :participants, through: :attendances

  validates :start_date, presence: true, if: :is_valid_date
  validates :duration, presence: true, numericality: {greater_than: 0}, if: :duration_test
  validates :title, presence: true, length: {in: 5..140 }
  validates :description, presence: true, length: {in: 20..500 }
  validates :price, presence: true
  validates_inclusion_of :price, in: 1..1000, message:'Le prix doit être de 1 à 1000'
  validates :location, presence: true

  def is_valid_date
    if start_date.nil? || DateTime.now > start_date
      errors.add(:start_date, :not_date ,{message: 'Un evenement doits être dans le futur'})
    end
  end
  def duration_test
    if duration.nil? || (duration % 5 != 0)
      errors.add(:duration, :not_pos5, {message:'Le durée doits être positif et multiple de 5'})
    end
  end

  def end_date
    self.start_date + (self.duration).minute
  end
  
end
