require "rails_helper"

RSpec.describe "As a visitor" do
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

	describe "when I visit the doctor index" do
		it "renders every doctor's name, years practiced, and university" do
			visit doctors_path

			expect(page).to have_content("Dr. #{@doctor1.name} has #{@doctor1.years_practiced} years of experience, and studied at #{@doctor1.university}")
			expect(page).to have_content("Dr. #{@doctor2.name} has #{@doctor2.years_practiced} years of experience, and studied at #{@doctor2.university}")
			expect(page).to have_content("Dr. #{@doctor3.name} has #{@doctor3.years_practiced} years of experience, and studied at #{@doctor3.university}")
			expect(page).to have_content("Dr. #{@doctor4.name} has #{@doctor4.years_practiced} years of experience, and studied at #{@doctor4.university}")
			expect(page).to have_content("Dr. #{@doctor5.name} has #{@doctor5.years_practiced} years of experience, and studied at #{@doctor5.university}")
			expect(page).to have_content("Dr. #{@doctor6.name} has #{@doctor6.years_practiced} years of experience, and studied at #{@doctor6.university}")
			expect(page).to have_content("Dr. #{@doctor7.name} has #{@doctor7.years_practiced} years of experience, and studied at #{@doctor7.university}")
		end

		it "sorts the doctors in order by years practiced from most to least" do
			visit doctors_path
			expect(@doctor3.name).to appear_before(@doctor4.name)
			expect(@doctor4.name).to appear_before(@doctor6.name)
			expect(@doctor6.name).to appear_before(@doctor1.name)
			expect(@doctor1.name).to appear_before(@doctor5.name)
			expect(@doctor5.name).to appear_before(@doctor7.name)
			expect(@doctor7.name).to appear_before(@doctor2.name)
		end
	end
end
