OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '430478643684586', '2cb61c5f642fdfc821a376a49281accc'  		   
end