Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer,
  :fields => [:username, :email, :admin_access_code],
  :uid_field => :email

  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
end
