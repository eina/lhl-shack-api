class Message < ActiveRecord::Base
  belongs_to :household

  validates_presence_of :message_text, :author

  scope :filter_by_household, lambda { |params|
    where({ household_id: params[:household_id] })
  }

  scope :filter_by_household_with_limit, lambda { |params|    
    where({ household_id: params[:household_id] }).order(:created_at).reverse_order.limit(params[:limit_by])
  }
end
