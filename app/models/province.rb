class Customer < ApplicationRecord
    belongs_to :province
  end
  
  class Province < ApplicationRecord
    has_many :customers
    validates :name, presence: true
  end
  