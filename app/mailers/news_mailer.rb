class NewsMailer < ActionMailer::Base
  default from: "bridotson@gmail.com"

  def welcome
    @user = User.first
    mail(to: "bookis.smuin+club@gmail.com", subject: "Welcome to Whirled Peas News")
  end

end
