# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning Database...'
Move.destroy_all

puts 'Creating moves...'

user = User.new
user.first_name = 'Yoaki'
user.last_name = 'Niscoise'
user.email = 'yoakiniscoise@gmail.com  '
user.gdata = [
  ['August', 553.762],
  ['November', 553.762],
  ['October', 553.762],
  ['December', 553.762],
  ['January', 553.762],
  ['February', 473.762]
]
user.password = 'b1a3c41e'
user.password_confirmation = 'b1a3c41e'
user.save!

user = User.new
user.first_name = 'Vincent'
user.last_name = 'Gonnard'
user.email = 'yoyo@gmail.com  '
user.gdata = [
  ['August', 3652],
  ['November', 3758],
  ['October', 3205],
  ['December', 3922],
  ['January', 4012],
  ['February', 3666]
]
user.password = 'ouioui'
user.password_confirmation = 'ouioui'
user.save!

Move.create(name: 'Pole Emploi', amount: 930, version: 'Revenu régulier', user_id: 1,
            date: DateTime.new(2022, 1, 30, 22, 35, 0))
Move.create(name: 'CAF', amount: 45, version: 'Revenu régulier', user_id: 1, date: DateTime.now)
Move.create(name: 'Course', amount: 150, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Electricité', amount: 75, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Transport', amount: 25, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Dette Crous', amount: 100, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Dette Wagon', amount: 70, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Netflix', amount: 12, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Mobile', amount: 15, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'CB N26', amount: 12, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Internet', amount: 22, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Amazon.P', amount: 7, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Spotify', amount: 10, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Muscu', amount: 30, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Assurance', amount: 12, version: 'Dépense régulière', user_id: 1, date: DateTime.now)
Move.create(name: 'Loyer', amount: 422, version: 'Dépense régulière', user_id: 1, date: DateTime.now)

Move.create(name: 'Salaire dev', amount: 2600, version: 'Revenu régulier', user_id: 2, date: DateTime.now)
Move.create(name: 'Sizebusiness', amount: 700, version: 'Revenu régulier', user_id: 2, date: DateTime.now)
Move.create(name: 'Course', amount: 150, version: 'Dépense régulière', user_id: 2, date: DateTime.now)
Move.create(name: 'Essence', amount: 320, version: 'Dépense régulière', user_id: 2, date: DateTime.now)
Move.create(name: 'Loisir', amount: 80, version: 'Dépense régulière', user_id: 2, date: DateTime.now)
Move.create(name: 'Loyer', amount: 700, version: 'Dépense régulière', user_id: 2, date: DateTime.now)
Move.create(name: 'Epargne', amount: 500, version: 'Epargne', user_id: 2, date: DateTime.now)

Projet.create(name: 'Voiture', amount: 3200, priority: 1, user_id: 1)
Projet.create(name: 'Maison', amount: 48_000, priority: 2, user_id: 1)
Projet.create(name: 'Chien', amount: 1200, priority: 5, user_id: 1)
Projet.create(name: 'PS5', amount: 500, priority: 3, user_id: 1)
Projet.create(name: 'RAM', amount: 200, priority: 4, user_id: 1)

puts 'Finished!'
