class NewsMailer < ActionMailer::Base

  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Welcome to Whirled Peas News")
  end

end
