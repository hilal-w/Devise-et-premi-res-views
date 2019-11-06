class UserMailer < ApplicationMailer
  #une adress email d'envoi
  default from: 'eventbrite@monsite.fr'

  def user_created_compte(user)
    @user = user
    #une var qu'on va use on view mail
    @url = 'http://moneventbrite.fr/login'

    mail(to: @user.email, subject: 'Compte cree avec succes !')
  end

  def event_participe(participed)
    @participed = participed
    @url = 'http://moneventbrite.fr/login'
    mail(to: @participed.event.admin.email, subject: 'Votre evenement a un nouveau participant !')
  end

end
