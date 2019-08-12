class Phonenumber < ApplicationRecord
  validates :number, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 1111111111, less_than_or_equal_to: 9999999999 }
end
