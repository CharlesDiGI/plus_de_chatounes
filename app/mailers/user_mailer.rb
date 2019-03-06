class UserMailer < ApplicationMailer
  # default from: 'no-reply@monsite.fr'

  def welcome_email(user)
    # #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    # #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url = "https://les-4-chatons-fantastiques.herokuapp.com/sign_in"
    # # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    # mail(to: @user.email, subject: 'Bienvenue chez nous !')

    mail(
    	from: "charles.digiampietro@gmail.com",
          subject: "This is a nice welcome email",
      to: @user.email,
      # delivery_method_options: { api_key: ENV['MJ_APIKEY_PUBLIC'], secret_key: ENV['MJ_APIKEY_PRIVATE'] }
      delivery_method_options: { version: 'v3.1' }
    )

    # variable = Mailjet::Send.create(messages: [{
    #     'From'=> {
    #         'Email'=> 'charles.digiampietro@gmail.com',
    #         'Name'=> 'Mailjet Pilot'
    #     },
    #     'To'=> [
    #         {
    #             'Email'=> @user.email,
    #             # 'Name'=> 'passenger 1'
    #         }
    #     ],
    #     'Subject'=> 'Your email flight plan!',
    #     'TextPart'=> 'Dear passenger 1, welcome to Mailjet! May the delivery force be with you!',
    #     'HTMLPart'=> '<h3>Dear passenger 1, welcome to Mailjet!</h3><br />May the delivery force be with you!'
    # }]
    # )
    # p variable.attributes['Messages']

  end

  def order_chaton

  end

  def inform_admin

  end

end
