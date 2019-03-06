class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
    # #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    # #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url = "https://les-4-chatons-fantastiques.herokuapp.com/sign_in"
    # # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')

# config SendGrid
    # mail(
    #   from: "charles.digiampietro@gmail.com",
    #   subject: "This is a nice welcome email",
    #   to: @user.email,
    #   # delivery_method_options: { api_key: ENV['MJ_APIKEY_PUBLIC'], secret_key: ENV['MJ_APIKEY_PRIVATE'] }
    #   delivery_method_options: { version: 'v3.1' }
    # )

  end

  def order_chaton

  end

  def inform_admin

  end

end
