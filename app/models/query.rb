class Query
  include Mongoid::Document
  field :book_id, type: String
  field :sender_id, type: String
  field :receiver_id, type: String
  field :body, type: String
  field :seen, type: Boolean
  field :created_at, type: DateTime, :default => Time.now

  has_many :responses, dependent: :destroy

  def self.unread
  	where(:seen => false)
  end

  def self.read
    where(:seen => true)
  end
end
