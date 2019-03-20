# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Attachment.destroy_all
Participant.destroy_all
Task.destroy_all
Trip.destroy_all
User.destroy_all

jacob = User.new(name: "Jacob", phone: "+19143238695", email: "jacob.coccari@gmail.com", password: "123456")
daniel = User.new(name: "Daniel", phone: "+14097182902", email: "danlin2902@yahoo.com", password: "123456")
marco = User.new(name: "Marco", phone: "+39435205976", email: "marco.fun@gmail.com", password: "123456")
regi = User.new(name: "Regi", phone: "+19143238695", email: "a.coccari@icloud.com", password: "123456")
jacob.save
daniel.save
marco.save
regi.save

trip1 = Trip.new(name: "EuroTrip 2019", destination: "Italy", start_date: DateTime.new(2019, 04, 23), end_date: DateTime.new(2019, 04, 30), photo: "https://en.wikipedia.org/wiki/Milan_Cathedral#/media/File:Milan_Cathedral_from_Piazza_del_Duomo.jpg", user: daniel)
trip2 = Trip.new(name: "AsiaTrip", destination: "Thailand", start_date: DateTime.new(2019, 05, 23), end_date: DateTime.new(2019, 05, 30), photo: "https://en.wikipedia.org/wiki/Thailand#/media/File:Nan_z_doi_phuka_2006_1003.jpg", user: jacob)
trip3 = Trip.new(name: "AmericaTrip", destination: "New York, New York", start_date: DateTime.new(2019, 02, 23), end_date: DateTime.new(2019, 02, 28), photo: "https://en.wikipedia.org/wiki/File:Joey_Badass.jpg", user: regi)
trip4 = Trip.new(name: "NewTrip 2020", destination: "France", start_date: DateTime.new(2019, 06, 23), end_date: DateTime.new(2019, 06, 30), photo: "https://en.wikipedia.org/wiki/Milan_Cathedral#/media/File:Milan_Cathedral_from_Piazza_del_Duomo.jpg", user: daniel)
trip1.save
trip2.save
trip3.save
trip4.save

Participant.create(user: jacob, trip: trip1, status: "pending")
Participant.create(user: regi, trip: trip1, status: "confirmed")
Participant.create(user: daniel, trip: trip2, status: "denied")
Participant.create(user: marco, trip: trip2, status: "confirmed")
Participant.create(user: daniel, trip: trip3, status: "denied")
Participant.create(user: marco, trip: trip3, status: "confirmed")

task_array = ["book plane tickets", "book the hostel", "buy museum tickets", "make sure your passport is valid", "get visa approved", "buy adapters for locale", "look for daytime activities", "check nightlife", "rent car"]

task_array.each do |task|
  trip = Trip.all.sample
  user = Participant.where(trip_id: trip.id).all.sample.user
  Task.create(name: task, description: "please get this done", user: user, trip: trip, due_date: trip.start_date, done_at: trip)
  user.save
end

