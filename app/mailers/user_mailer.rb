class UserMailer < ApplicationMailer
  default from: "donotreply@pesteco.com"

  def welcome(user)
    @user = user
    mail( :to => @user.email, :subject => 'Welcome to Pesteco dashboard', :cc => 'howardmann27@gmail.com' )
  end

end
