module ApplicationHelper
  def format_flash_message
    if flash[:success]
      flash[:success].html_safe
    elsif flash[:error]
      flash[:error].html_safe
    end
  end

  def yield_meta_tag(default_text='')
    content_for?(:"meta_description") ? content_for(:"meta_description") : default_text
  end
end
