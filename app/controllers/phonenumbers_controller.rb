class PhonenumbersController < ApplicationController
  def create
    phonenumber = Phonenumber.new(phonenumber_params)
    
    phonenumber = Phonenumber.create_random unless phonenumber.save

    render json: { phonenumber: phonenumber }, status: :ok
  end

  private

  def phonenumber_params
    params.permit(:number) 
  end
end
