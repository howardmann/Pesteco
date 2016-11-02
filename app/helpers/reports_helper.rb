module ReportsHelper

  def format_email_report(report)
    report_url = cl_image_path(report.pdf)

    mail_to('', 'Email', {:subject => "Pesteco report: #{report.building.name}", :cc => 'howardmann27@gmail.com', :body => "To view your Pesteco report copy the secure link below to your browser: \n \n #{report_url}"})
  end

end
