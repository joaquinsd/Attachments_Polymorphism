class CreditCard < ApplicationRecord
  has_many :transbanks, as: :transbankeable
end
