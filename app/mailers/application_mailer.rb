class ApplicationMailer < ActionMailer::Base
  default from: "dimitritchomnou@gmail.com <>"
  default to: "dimitritchomnou@yahoo.fr"
  layout 'mailer'
end
