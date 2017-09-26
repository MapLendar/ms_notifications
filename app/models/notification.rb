class Notification

  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :event_name, type:String
  field :event_date, type:DateTime
  field :event_time, type:DateTime
  field :email, type:String

  validates_presence_of :event_name, :event_date, :event_time, :email
  
end
