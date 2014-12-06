class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  def self.latest(number)
    Article.order(created_at: :desc).first(number)
  end

  def content_snippet(number)
    content.split(" ").first(number).join(" ")
  end

end
