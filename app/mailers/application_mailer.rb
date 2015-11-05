class ApplicationMailer < ActionMailer::Base
  default from: "orders@cosmiccola.com"
  layout 'mailer'
end
