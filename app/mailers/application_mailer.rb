class ApplicationMailer < ActionMailer::Base
  default from: "Evolution Design <dimitritchomnou@evolutiondesign.herokuapp.com>"
  default to: "dimitritchomnou@evolutiondesign.herokuapp.com"
  layout 'mailer'
end
