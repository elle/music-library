class Album
  include DataMapper::Resource

  property :id,         Serial
  property :author,     String  
  property :publisher,  String  
  property :location,   String  
  property :year,       Integer
  property :edition,    Integer
  property :title,      String
  property :detail,     Text
  property :style,      String
  property :created_at, DateTime
  property :updated_at, DateTime

  validates_present :title
end