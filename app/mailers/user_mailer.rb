class UserMailer < ActionMailer::Base
  default from: "admin@mox.com"

  def auth_token_confirm(user)
    @user = user
    mail(to: user.email, subject: "Authorization Token for Requests")
  end
end
