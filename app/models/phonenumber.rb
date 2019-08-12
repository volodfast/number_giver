class Phonenumber < ApplicationRecord
  validates :number, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 1111111111, less_than_or_equal_to: 9999999999 }


  def self.create_random
    numbers = all_numbers

    raise 'No numbers left' if numbers.count >= (9999999999 - 1111111111)

    new_number = new(number: random_number)
    new_number.save

    new_number
  end

  
  private
  
  def self.all_numbers
    all.map { |phonenumber| phonenumber.number }
  end

  def self.random_number
    numbers = all_numbers
    
    for i in 1111111111..9999999999
      return i unless numbers.include?(i)
    end
  end

end
