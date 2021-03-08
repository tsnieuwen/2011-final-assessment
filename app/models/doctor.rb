class Doctor < ApplicationRecord

  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries


  def self.order_by_experience
    order(years_practiced: :desc)
  end

end
