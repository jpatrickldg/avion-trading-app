# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.new 
user1.email = "admin@admin.com"
user1.password = "123456"
user1.password_confirmation = "123456"
user1.first_name = "admin"
user1.last_name = "admin"
user1.role = 1
user1.confirmed_at = Time.now
user1.save!

user2 = User.new 
user2.email = "test@test.com"
user2.password = "123456"
user2.password_confirmation = "123456"
user2.first_name = "test"
user2.last_name = "test"
user2.role = 0
user2.confirmed_at = Time.now
user2.save!

stock1 = Stock.new 
stock1.name = "Advanced Micro Devices"
stock1.symbol = "AMD"
stock1.save!

stock2 = Stock.new 
stock2.name = "NVIDIA Corporation"
stock2.symbol = "NVDA"
stock2.save!

stock3 = Stock.new 
stock3.name = "GameStop Corp."
stock3.symbol = "GME"
stock3.save!

stock4 = Stock.new 
stock4.name = "Apple Inc."
stock4.symbol = "AAPL"
stock4.save!

stock5 = Stock.new 
stock5.name = "Alphabet, Inc."
stock5.symbol = "GOOG"
stock5.save!

stock6 = Stock.new 
stock6.name = "Microsoft Corporation"
stock6.symbol = "MSFT"
stock6.save!

stock7= Stock.new 
stock7.name = "Twitter, Inc."
stock7.symbol = "TWTR"
stock7.save!

stock8 = Stock.new 
stock8.name = "Meta Platforms, Inc."
stock8.symbol = "META"
stock8.save!

stock9 = Stock.new 
stock9.name = "Amazon.com Inc."
stock9.symbol = "AMZN"
stock9.save!

stock10 = Stock.new 
stock10.name = "Bed Bath & Beyond Inc."
stock10.symbol = "BBBY"
stock10.save!