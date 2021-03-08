require 'rails_helper'

RSpec.describe Doctor, type: :model do

  describe 'relationships' do
    it { should have_many :doctor_surgeries }
    it { should have_many(:surgeries).through(:doctor_surgeries) }
  end

  describe 'class methods' do
    before :each do
      @doctor1 = Doctor.create!(name: "Hank", years_practiced: 12, university: "Vermont")
      @doctor2 = Doctor.create!(name: "Linda", years_practiced: 2, university: "New Hampshire")
      @doctor3 = Doctor.create!(name: "Billy", years_practiced: 40, university: "Maine")
      @doctor4 = Doctor.create!(name: "Carol", years_practiced: 31, university: "Boston University")
      @doctor5 = Doctor.create!(name: "Liz", years_practiced: 8, university: "Rhode Island")
      @doctor6 = Doctor.create!(name: "Dre", years_practiced: 21, university: "Hard Knocks")
      @doctor7 = Doctor.create!(name: "Phil", years_practiced: 3, university: "Texas")
    end

    it 'order_by_experience' do
      expect(Doctor.order_by_experience).to eq([@doctor3, @doctor4, @doctor6, @doctor1, @doctor5, @doctor7, @doctor2])
    end 
  end

end
