class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.order_by_experience
  end

end
