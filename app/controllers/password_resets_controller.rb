class PasswordResetsController < ApplicationController
  def new
  end

  def create
    # For security reason flash notice to root_url whether user exists or not, this increases security as hacker wont know if email is valid or not
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:success] = 'Email sent with password reset instructions'
    redirect_to root_path
  end

  # We use the ! so that if the user is not found it returns a 404 error
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  # Password reset custom method
  def update
    # First find user by he token passed from the email, if no user throw a 404
    @user = User.find_by_password_reset_token!(params[:id])

    # If token is expired send back to reset page, otherwise attempt to update user, if error then renreder edit password page
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:error] = "Password reset token has expired"
      redirect_to new_password_reset_path
    else
      @user.update_attributes(user_params)
      if @user.save
        flash[:success] = "Password has been reset"
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
