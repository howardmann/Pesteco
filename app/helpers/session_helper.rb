module SessionHelper
  def format_session_current_user_nav(user)
    if user && user.admin
      link_to('Admin', clients_path)
    elsif user
      account = link_to user.name.split(' ')[0], client_path(user.client)
    else
      link_to 'Login', login_path
    end
  end

  def format_session_login_logout(user)
    unless user
      link_to 'Login', login_path
    else
      link_to 'Logout', logout_path, method: :delete
    end
  end

end
