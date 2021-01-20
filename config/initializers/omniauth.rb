Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oath2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], skip_jwt: true
end
