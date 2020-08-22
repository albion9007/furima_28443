class Buy < ApplicationRecord
  
  with_options presence: true do
    validates :price
  end

  belongs_to :item
  belongs_to :user
  has_one :address

end
