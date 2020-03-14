class Document < ActiveRecord::Base
  belongs_to :households
  validates_presence_of :s3_identifier
end
