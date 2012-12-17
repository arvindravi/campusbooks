class User
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  field :name, type: String  
  field :first_name, type: String
  field :last_name, type: String
  field :picture_url, type: String
  field :oauth_token, type: String
  field :oauth_expires_at, type: Time
  field :reg_no, type: String, default: nil

  def self.from_omniauth(auth)  	
    where(auth.slice(:provider, :uid)).find_or_initialize_by.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.picture_url = auth.info.image
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!      
    end    
  end
  
 has_many :books
end
