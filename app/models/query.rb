class Query
  include Mongoid::Document
  field :book_id, type: String
  field :sender_id, type: String
  field :receiver_id, type: String
  field :body, type: String
  field :seen, type: Boolean

  has_many :responses  

  def self.unread
  	where(:seen => false)
  end

  def self.read
    where(:seen => true)
  end
end
