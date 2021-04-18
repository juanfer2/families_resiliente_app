class FamilyDocument < ApplicationRecord
  belongs_to :professional
  has_many_attached :document
end
