class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :welcome_send

  has_many :event_admins, foreign_key: 'event_admin_id', class_name: 'Event', dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances, dependent: :destroy

  validates :email,
            format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'Email is invalid' },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
