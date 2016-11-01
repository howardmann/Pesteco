class UserMailer < ApplicationMailer
  default from: "howardmann27@gmail.com"

  def welcome(user)
    @user = user
    mail( :to => @user.email, :subject => 'Welcome to Pesteco dashboard' )
  end

end
