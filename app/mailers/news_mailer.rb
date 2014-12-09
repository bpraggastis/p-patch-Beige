class NewsMailer < ActionMailer::Base
  default from: "bridotson@gmail.com"

  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: "bookis.smuin+club@gmail.com", subject: "Welcome to Whirled Peas")
  end

end
