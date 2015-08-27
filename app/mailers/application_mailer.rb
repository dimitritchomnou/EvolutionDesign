class ApplicationMailer < ActionMailer::Base
  default from: "Evolution Design <dimitritchomnou@evolutiondesign.herokuapp.com>"
  default to: "dimitritchomnou@gmail.com"
  layout 'mailer'
end
