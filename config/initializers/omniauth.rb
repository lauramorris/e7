# config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    "958931029418.apps.googleusercontent.com",
    "plBeD_IFuYzX4i3FxLFcJif6",
    {name: "google_login", approval_prompt: ''}
end 
