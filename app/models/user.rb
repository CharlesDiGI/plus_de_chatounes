class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders


  def welcome_send
    # UserMailer.welcome_email(self).deliver_now
variable = Mailjet::Send.create(messages: [{
    'From'=> {
        'Email'=> 'charles.digiampietro@gmail.com',
        # 'Name'=> 'Mailjet Pilot'
    },
    'To'=> [
        {
            'Email'=> 'passenger1@mailjet.com',
            'Name'=> 'passenger 1'
        }
    ],
    'Subject'=> 'Your email flight plan!',
    'TextPart'=> 'Dear passenger 1, welcome to Mailjet! May the delivery force be with you!',
    'HTMLPart'=> '<h3>Dear passenger 1, welcome to Mailjet!</h3><br />May the delivery force be with you!'
}]
)
p variable.attributes['Messages']
  end
  
end
