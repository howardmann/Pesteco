ActionMailer::Base.raise_delivery_errors = false

ActionMailer::Base.default_url_options = { :host => 'pesteco.herokuapp.com' }

ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.secrets.sendgrid_username,
  :password => Rails.application.secrets.sendgrid_password,
  :domain => ENV["RAILS_ENV"] == "development" ? "localhost" : "pesteco.herokuapp.com",
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
