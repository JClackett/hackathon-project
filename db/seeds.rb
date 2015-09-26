# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users_list = [
  { first_name: "Andrew", last_name: "Mitchell", email: 'doctor1@gmail.com', password: 'password'},
  { first_name: "Bob", last_name: "Stinson", email: 'doctor2@gmail.com', password: 'password'},
  { first_name: "Betty", last_name: "Stratford",email: 'patient1@gmail.com', password: 'password'},
  { first_name: "Stanley", last_name: "Rimple",email: 'patient2@gmail.com', password: 'password'},
]

users_list.each do |user|
  User.create(user)
end

doctors_list = [
  { user_id: '1'},
  { user_id: '2'},
]

doctors_list.each do |doctor|
  Doctor.create(doctor)
end

patients_list = [
  { user_id: '3', doctors_id: '1'},
  { user_id: '4', doctors_id: '2'},
]

patients_list.each do |patient|
  Patient.create(patient)
end

posts_list = [
  { patient_id: '1', location: 'head', discomfort: '7', frequency: 'intermittent', initial_occurence: 'last week', notes: "I've had a pretty bad headache on and off for a week"},
  { patient_id: '2', location: 'throat', discomfort: '2', frequency: 'constant', initial_occurence: 'yesterday morning', notes: "Woke up yesterday with a very tickly cough"},
]

posts_list.each do |post|
  Post.create(post)
end


