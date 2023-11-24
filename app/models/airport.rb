class Airport < ApplicationRecord
    validates :code, presence: true, uniqueness: true, length: { is: 3 }
end
