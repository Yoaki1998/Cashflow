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

user = User.new
user.email = 'yoakiniscoise@gmail.com  '
user.gdata = [
    ["August",3652],
    ["November",3758],
    ["October",3205],
    ["December",3922],
    ["January",4012],
    ["February",3666]
]
user.password = 'b1a3c41e'
user.password_confirmation = 'b1a3c41e'
user.save!

user = User.new
user.email = 'yoyo@gmail.com  '
user.gdata = [
    ["August",3652],
    ["November",3758],
    ["October",3205],
    ["December",3922],
    ["January",4012],
    ["February",3666]
]
user.password = 'ouioui'
user.password_confirmation = 'ouioui'
user.save!



Move.create(name:"Salaire dev", amount:3200, version:"Revenu régulier", user_id:1, date: DateTime.new(2022,1,30,22,35,0))
Move.create(name:"Sizebusiness", amount:1200, version:"Revenu régulier", user_id:1, date: DateTime.now)
Move.create(name:"S&P500", amount:1200, version:"Investissement boursier", taux:8, user_id:1, date: DateTime.now)
Move.create(name:"Course", amount:150, version:"Dépense régulière", user_id:1, date: DateTime.now)
Move.create(name:"Essence", amount:320, version:"Dépense régulière", user_id:1, date: DateTime.now)
Move.create(name:"Réparation", amount:300, version:"Dépense ponctuelle", user_id:1, date: DateTime.now)
Move.create(name:"Loyer", amount:1200, version:"Dépense régulière", user_id:1, date: DateTime.now)
Move.create(name:"Epargne", amount:500, version:"Epargne", user_id:1, date: DateTime.now)

Move.create(name:"Salaire dev", amount:2600, version:"Revenu régulier", user_id:2, date: DateTime.now)
Move.create(name:"Sizebusiness", amount:700, version:"Revenu régulier", user_id:2, date: DateTime.now)
Move.create(name:"Course", amount:150, version:"Dépense régulière", user_id:2, date: DateTime.now)
Move.create(name:"Essence", amount:320, version:"Dépense régulière", user_id:2, date: DateTime.now)
Move.create(name:"Loisir", amount:80, version:"Dépense régulière", user_id:2, date: DateTime.now)
Move.create(name:"Loyer", amount:700, version:"Dépense régulière", user_id:2, date: DateTime.now)
Move.create(name:"Epargne", amount:500, version:"Epargne", user_id:2, date: DateTime.now)

puts "Finished!"