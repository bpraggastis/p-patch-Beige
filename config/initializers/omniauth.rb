Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer,
  :fields => [:username, :email, :admin_access_code],
  :uid_field => :email
end
