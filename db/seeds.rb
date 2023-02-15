# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning Database..."
Move.destroy_all

puts "Creating moves..."

Move.create(name:"Salaire dev", amount:3200, version:"salaire", user_id:1, date: DateTime.now)
Move.create(name:"Sizebusiness", amount:1200, version:"salaire", user_id:1, date: DateTime.now)
Move.create(name:"Course", amount:-150, version:"depense", user_id:1, date: DateTime.now)
Move.create(name:"Essence", amount:-320, version:"depense", user_id:1, date: DateTime.now)
Move.create(name:"Réparation", amount:-300, version:"depense", user_id:1, date: DateTime.now)
Move.create(name:"Loyer", amount:-1200, version:"depense", user_id:1, date: DateTime.now)
Move.create(name:"Epargne", amount:500, version:"epargne", user_id:1, date: DateTime.now)
Move.create(name:"Salaire dev", amount:2600, version:"salaire", user_id:2, date: DateTime.now)
Move.create(name:"Sizebusiness", amount:700, version:"salaire", user_id:2, date: DateTime.now)
Move.create(name:"Course", amount:-150, version:"depense", user_id:2, date: DateTime.now)
Move.create(name:"Essence", amount:-320, version:"depense", user_id:2, date: DateTime.now)
Move.create(name:"Loisir", amount:-80, version:"depense", user_id:2, date: DateTime.now)
Move.create(name:"Loyer", amount:-700, version:"depense", user_id:2, date: DateTime.now)
Move.create(name:"Epargne", amount:500, version:"epargne", user_id:2, date: DateTime.now)

puts "Finished!"