OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '511941702284307', '3216d89c88e60e2320180ab8f54ff7e5'
end