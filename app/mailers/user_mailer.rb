class UserMailer < ApplicationMailer
  # default from: "info@pesteco.com.au"
  default from: "donotreply@pesteco.com.au"

  def welcome(user)
    @user = user
    mail( :to => @user.email, :subject => 'Pesteco welcome', :bcc => 'howardmann27@gmail.com' )
  end

  def password_reset(user)
    @user = user
    mail( :to => @user.email, :subject => "Pesteco password reset")
  end

end
