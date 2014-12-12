def EmailNewArticleJob
  @queue = :new_article_emails
  def self.perform(article_id)
    NewsMailer.send_article(article_id).deliver
  end
end
