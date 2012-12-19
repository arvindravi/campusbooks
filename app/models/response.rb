class Response
  include Mongoid::Document
  field :body, type: String

  belongs_to :query
end
