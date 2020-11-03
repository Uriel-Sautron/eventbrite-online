class AttendanceMailer < ApplicationMailer
  default from: 'yeyel974@hotmail.com' 

  def join_event(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = attendance.user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://eventbrite-online.herokuapp.com/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Ton Evenement !') 
  end
end
