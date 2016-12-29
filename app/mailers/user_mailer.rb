class UserMailer < ApplicationMailer
  default from: "info@pesteco.com.au"

  def welcome(user)
    @user = user
    mail( :to => @user.email, :subject => 'Pesteco welcome' )
  end

  def password_reset(user)
    @user = user
    mail( :to => @user.email, :subject => "Pesteco password reset")
  end

end
