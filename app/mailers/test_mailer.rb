class TestMailer < ActionMailer::Base
  default from: "Test <test@example.com>"
  layout "mailer"
  def test_send(email)
    @email = email
    mail(to: @email, subject: "Test Send")
  end
end
