class NewsMailer < ActionMailer::Base
  default from: "no-reply@whirled-peas.herokuapp.com"

  def welcome(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "[whirled-peas] Welcome to Whirled Peas News")
  end

  def send_article(article_id)
    @article = Article.find(article_id)
    user_emails = User.all.collect(&:email).join(",")
    mails(to: user_emails, subject: "[whirled-peas] A new event was just posted!")
  end

end
