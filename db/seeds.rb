# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users_list = [
  { first_name: "Andrew", last_name: "Mitchell", doctor: true, email: 'doctor1@gmail.com', password: 'password'},
  { first_name: "Bob", last_name: "Stinson", doctor: true, email: 'doctor2@gmail.com', password: 'password'},
  { first_name: "Betty", last_name: "Stratford",email: 'patient1@gmail.com', password: 'password'},
  { first_name: "Stanley", last_name: "Rimple",email: 'patient2@gmail.com', password: 'password'},
  { first_name: "Stannis", last_name: "Baratheon",email: 'patient3@gmail.com', password: 'password'},
  { first_name: "Rob", last_name: "Stark",email: 'patient4@gmail.com', password: 'password'},
  { first_name: "Cersei", last_name: "Lannister",email: 'patient5@gmail.com', password: 'password'},
  { first_name: "Peter", last_name: "Dinklage",email: 'patient6@gmail.com', password: 'password'},
  { first_name: "Samwise", last_name: "Gamgee",email: 'patient7@gmail.com', password: 'password'},
  { first_name: "Bob", last_name: "Splinger",email: 'patient8@gmail.com', password: 'password'},
  { first_name: "Benois", last_name: "Le Hateau",email: 'patient9@gmail.com', password: 'password'},
  { first_name: "Cesar", last_name: "Spinzwazar",email: 'patient10@gmail.com', password: 'password'},
  { first_name: "Eduardo", last_name: "Framptoni",email: 'patient11@gmail.com', password: 'password'},
  { first_name: "David", last_name: "Finkbrau",email: 'patient12@gmail.com', password: 'password'},
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
  { user_id: '3', doctor_id: '1'},
  { user_id: '4', doctor_id: '2'},
  { user_id: '5', doctor_id: '2'},
  { user_id: '6', doctor_id: '1'},
  { user_id: '7', doctor_id: '1'},
  { user_id: '8', doctor_id: '2'},
  { user_id: '9', doctor_id: '2'},
  { user_id: '10', doctor_id: '1'},
  { user_id: '11', doctor_id: '2'},
  { user_id: '12', doctor_id: '1'},
  { user_id: '13', doctor_id: '2'},
  { user_id: '14', doctor_id: '1'},
]

patients_list.each do |patient|
  Patient.create(patient)
end

posts_list = [
  { patient_id: '1', doctor_id: '1', location: 'Head', discomfort: '7', frequency: 'Intermittent', initial_occurence: 'Last Week', notes: "I've had a pretty bad headache on and off for a week"},
  { patient_id: '1', doctor_id: '1', location: 'Throat', discomfort: '2', frequency: 'Constant', initial_occurence: 'Yesterday Morning', notes: "Woke up yesterday with a very tickly cough"},
  { patient_id: '1', doctor_id: '1', location: 'Neck', discomfort: '5', frequency: 'Now and Then', initial_occurence: 'Two Days Ago', notes: "Woke up with extremely sore neck"},
]

posts_list.each do |post|
  Post.create(post)
end


