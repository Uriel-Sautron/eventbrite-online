class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user

  validates :star_date, presence: true#, if: :star_date > Time.now
  validates :duration, presence: true# numericality: {greater_than: 0 } if: :duration%5 == 0
  validates :title, presence: true#, lenght { in: 5..140 }
  validates :description, presence: true#, lenght { in: 20..1000 }
  validates :price, presence: true# numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
  validates :location, presence: true

 

end
