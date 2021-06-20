class WebPay < ApplicationRecord
  has_many :transbanks, as: :transbankeable
end
