require 'rails_helper'

RSpec.describe Surgery, type: :model do

  describe 'relationships' do
    it { should have_many :doctor_surgeries }
    it { should have_many(:doctors).through(:doctor_surgeries) }
  end

  describe 'instance methods' do
    before :each do
      @doctor1 = Doctor.create!(name: "Hank", years_practiced: 12, university: "Vermont")
      @doctor2 = Doctor.create!(name: "Linda", years_practiced: 2, university: "New Hampshire")
      @doctor3 = Doctor.create!(name: "Billy", years_practiced: 40, university: "Maine")
      @doctor4 = Doctor.create!(name: "Carol", years_practiced: 31, university: "Boston University")
      @doctor5 = Doctor.create!(name: "Liz", years_practiced: 8, university: "Rhode Island")
      @doctor6 = Doctor.create!(name: "Dre", years_practiced: 21, university: "Hard Knocks")
      @doctor7 = Doctor.create!(name: "Phil", years_practiced: 3, university: "Texas")

      @surgery1 = Surgery.create!(title: "Tonsillectomy", day_of_week: "Monday", operating_room_number: '113')
      @surgery2 = Surgery.create!(title: "Turn that frown upside down-tomy", day_of_week: "Tuesday", operating_room_number: '50')

      DoctorSurgery.create!(doctor: @doctor1, surgery: @surgery1)
      DoctorSurgery.create!(doctor: @doctor2, surgery: @surgery1)
      DoctorSurgery.create!(doctor: @doctor3, surgery: @surgery1)
      DoctorSurgery.create!(doctor: @doctor4, surgery: @surgery1)
      DoctorSurgery.create!(doctor: @doctor5, surgery: @surgery1)
      DoctorSurgery.create!(doctor: @doctor6, surgery: @surgery2)
      DoctorSurgery.create!(doctor: @doctor7, surgery: @surgery2)
      DoctorSurgery.create!(doctor: @doctor5, surgery: @surgery2)
      DoctorSurgery.create!(doctor: @doctor4, surgery: @surgery2)
    end

    it '#most_experienced_doctors' do
      expect(@surgery1.most_experienced_doctors).to eq([@doctor3, @doctor4])
    end

    it '#least_experienced_doctors' do
      expect(@surgery1.least_experienced_doctors).to eq([@doctor2, @doctor5])
    end
  end
end
