class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  def self.latest_ten
    Article.order(:created_at).first(10)
  end

end
