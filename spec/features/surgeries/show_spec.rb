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

	describe "when I visit a surgery show page" do
		it "renders the surgery's title, day of the week, and operating room number" do
			visit surgery_path(@surgery1)

			expect(page).to have_content("#{@surgery1.title} surgery is on #{@surgery1.day_of_week} and is in operating room #{@surgery1.operating_room_number}")
		end

		it "renders the doctor's that will be performing the surgery along with their experience" do
			visit surgery_path(@surgery1)

			expect(page).to have_content("Dr. #{@doctor1.name}, #{@doctor1.years_practiced} years of experience")
			expect(page).to have_content("Dr. #{@doctor2.name}, #{@doctor2.years_practiced} years of experience")
			expect(page).to have_content("Dr. #{@doctor3.name}, #{@doctor3.years_practiced} years of experience")
			expect(page).to have_content("Dr. #{@doctor4.name}, #{@doctor4.years_practiced} years of experience")
			expect(page).to have_content("Dr. #{@doctor5.name}, #{@doctor5.years_practiced} years of experience")

			within("#most_experienced-") do
				expect(page).to have_content("Dr. #{@doctor3.name}, #{@doctor3.years_practiced} years of experience")
				expect(page).to have_content("Dr. #{@doctor4.name}, #{@doctor4.years_practiced} years of experience")
			end

			within("#least_experienced-") do
				expect(page).to have_content("Dr. #{@doctor2.name}, #{@doctor2.years_practiced} years of experience")
				expect(page).to have_content("Dr. #{@doctor5.name}, #{@doctor5.years_practiced} years of experience")
			end

		end

		it "renders a form to add a doctor to the surgery" do
			visit surgery_path(@surgery1)

			expect(page).to have_content("Add doctor to surgery")
			expect(page).to have_button("Submit")
		end

		it "returns me to the surgery show page, with the doctor I added listed, after I fill out the form and click submit" do
			visit surgery_path(@surgery2)

			fill_in :name, with: "#{@doctor3.name}"
			click_button("Submit")
			expect(current_path).to eq(surgery_path(@surgery2))
			expect(page).to have_content("Dr. #{@doctor3.name}, #{@doctor3.years_practiced} years of experience")
		end
	end
end
