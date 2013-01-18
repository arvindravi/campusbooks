class Book
  include Mongoid::Document
  field :title, type: String
  field :author, type: String
  field :sold, type: Boolean
  field :isbn, type: String
  field :image_url, type: String
  field :semester, type: String
  field :price, type: String
  field :pages, type: String
  field :created_at, type: DateTime, :default => Time.now

  validates_presence_of :title,:author,:semester,:price
  validates_numericality_of :price
  belongs_to :user
end
