class Message < ActiveRecord::Base
  belongs_to :household

  validates_presence_of :messages, :author
end
