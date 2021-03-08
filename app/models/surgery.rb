class Surgery < ApplicationRecord

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def most_experienced_doctors
    doctors.order(years_practiced: :desc).limit(2)
  end

  def least_experienced_doctors
    doctors.order(years_practiced: :asc).limit(2)
  end

end
