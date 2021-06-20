class OneClick < ApplicationRecord
  has_many :transbanks, as: :transbankeable
end
