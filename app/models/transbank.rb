class Transbank < ApplicationRecord
  belongs_to :transbankeable, polymorphic: true
  has_many :payments, as: :payable
end
