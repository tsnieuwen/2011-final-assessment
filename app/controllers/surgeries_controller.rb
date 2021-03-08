class SurgeriesController < ApplicationController

  def show
    @surgery = Surgery.find(params[:id])
    @all_doctors = @surgery.doctors
    @experienced_docs = @surgery.most_experienced_doctors
    @inexperienced_docs = @surgery.least_experienced_doctors
  end

end
