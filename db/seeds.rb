# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
