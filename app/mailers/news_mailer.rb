class NewsMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Welcome to Whirled Peas News")
  end

end
