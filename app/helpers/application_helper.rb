module ApplicationHelper
  def format_flash_message
    if flash[:success]
      flash[:success].html_safe
    elsif flash[:error]
      flash[:error].html_safe
    end
  end

end
