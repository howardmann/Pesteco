module ReportsHelper

  def format_email_report(report)
    report_url = cl_image_path(report.pdf)

    mail_to('', 'Email', {:subject => "Pesteco report: #{report.building.name}", :cc => 'howardmann27@gmail.com', :body => "Please copy the secure link below into your internet browser to view your Pesteco report: \n \n #{report_url}", :encode => 'javascript'})
  end

end
