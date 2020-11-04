class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :event_admin, class_name: 'User', optional: true

  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true
  validate :is_future?, :divisable_by_five?

  private

  def is_future?
    if start_date != nil
      if Time.now > start_date
        errors.add(:start_date, "date de départ peut pas être passée !")
      end
    end
  end

  def divisable_by_five?
    errors.add(:duration, "must be a multiple of 5") unless duration % 5 == 0 
  end

end
