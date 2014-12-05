class User < ActiveRecord::Base
  has_secure_password :validations => false
  has_many :articles
  has_many :comments

  def is_admin?
    true
  end

  def self.new_twitter_user(auth_hash)
    User.create(uid: auth_hash.uid, username: auth_hash.info.nickname, display_name: auth_hash.info.name ||= "New Twitter User")
  end

  # this creates an account which links to Twitter, but still need to create
  # edit_user page which permits other fields for user to be produced



end
