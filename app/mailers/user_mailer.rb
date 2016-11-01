class UserMailer < ApplicationMailer
  default from: "donotreply@pesteco.com"

  def welcome(user)
    @user = user
    mail( :to => @user.email, :subject => 'Pesteco welcome', :cc => 'howardmann27@gmail.com' )
  end

  def password_reset(user)
    @user = user
    mail( :to => @user.email, :subject => "Pesteco password reset")
  end

end
