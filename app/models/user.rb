class User < ActiveRecord::Base
  has_secure_password
  has_many :articles
  has_many :comments

  def is_admin?
    false
  end

  def self.new_twitter_user(uid)
    User.create(uid: uid, display_name: "Twitter User")
  end

  # this creates an account which links to Twitter, but still need to create
  # edit_user page which permits other fields for user to be produced



end
