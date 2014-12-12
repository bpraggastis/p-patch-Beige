class User < ActiveRecord::Base
  has_secure_password :validations => false
  has_many :articles
  has_many :comments
  has_many :events
  validates :username, uniqueness: true, allow_nil: true
  validates :password, confirmation: true
  # confirmation not working - issue with multiple ways to login
  # need to create conditional validation which permits no password
  # if login is done through Twitter

  def is_admin?
    true if admin_rights == "true"
  end

  def make_admin
    update(admin_rights: "true")
  end

  def revoke_admin
    update(admin_rights: nil)
  end

  def self.new_twitter_user(auth_hash)
    User.create(uid: auth_hash.uid, display_name: auth_hash.info.name ||= "New Twitter User")
  end


end
