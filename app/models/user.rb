class User < ActiveRecord::Base

  has_many :articles
  has_many :comments

  def is_admin?
    false
  end



end
