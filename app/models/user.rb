class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders

   validates :first_name, presence: true
   validates :last_name, presence: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
end
