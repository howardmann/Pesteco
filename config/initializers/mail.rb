ActionMailer::Base.raise_delivery_errors = false

ActionMailer::Base.default_url_options = { :host => ENV["RAILS_ENV"] == "development" ? "localhost:3000" : 'pesteco.herokuapp.com' }

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :domain => ENV["RAILS_ENV"] == "development" ? "localhost:3000" : "pesteco.herokuapp.com",
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name => ENV["SENDGRID_USERNAME"],
  :password => ENV["SENDGRID_PASSWORD"]
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
