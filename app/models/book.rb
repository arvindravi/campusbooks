class Book
  include Mongoid::Document
  field :title, type: String
  field :author, type: String
  field :status_flag, type: Integer
  field :isbn, type: String
  field :image_url, type: String
  field :semester, type: String
  field :price, type: String

  belongs_to :user
end
