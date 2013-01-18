class Response
  include Mongoid::Document
  field :body, type: String
  field :sender_id, type: String
  field :receiver_id, type: String
  field :seen, type: Boolean

  validates_presence_of :body

  belongs_to :query

  def self.unread
  	where(:seen => false)
  end

  def self.read
  	where(:seen => true)
  end
end
