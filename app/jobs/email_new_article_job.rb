def EmailNewArticleJob
  @queue = :new_article_emails
  def self.perform
    
  end
end
