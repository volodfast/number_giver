class Phonenumber < ApplicationRecord
  MIN_NUMBER = 1111111111
  MAX_NUMBER = 9999999999

  validates :number, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: MIN_NUMBER, less_than_or_equal_to: MAX_NUMBER }


  def self.create_random
    numbers = all_numbers

    raise 'No numbers left' if numbers.count >= (MAX_NUMBER - MIN_NUMBER)

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
    
    for i in MIN_NUMBER..MAX_NUMBER
      return i unless numbers.include?(i)
    end
  end

end
