module SessionHelper
  def format_session_current_user_nav(user)
    if user && user.admin
      link_to('Admin', clients_path)
    elsif user
      account = link_to user.name.split(' ')[0], user_path(user)
    else
      link_to 'Client Login', login_path
    end
  end

  def format_session_logout(user)
    link_to 'Logout', logout_path, method: :delete if user
  end

end
