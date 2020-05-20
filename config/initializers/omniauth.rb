OmniAuth.config.logger = Rails.logger
#************************************************
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'b47bcd08fe9c8a0969d5','f10491d6b82059c4e836b7d6bb09cc594fb51d2d',
         { :name => "github", :scope => ['read:user','user:email']}
  # provider :facebook, 'tbd', 'tbd'           
  #provider :nnn, 'api_key', 'api_secret'
  #provider :twitter, 
  #provider :facebook, 
  #provider :google_oauth2, 	
  #provider :linkedin, 
end