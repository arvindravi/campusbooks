class Response
  include Mongoid::Document
  field :body, type: String
  field :sender_id, type: String
  field :receiver_id, type: String

  belongs_to :query
end
