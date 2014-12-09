class NewsMailer < ActionMailer::Base
  default from: "bridotson@gmail.com"

  def welcome
    @user = User.first
    mail(to: @user.email, subject: "Welcome to Whirled Peas News")
  end

end
