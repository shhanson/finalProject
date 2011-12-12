# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ username: 'Sarah', email: 'shanson@cs.utsa.edu', password: 'hello', password_confirmation: 'hello' }, { username: 'Adam', email: 'adylla@cs.utsa.edu', password: 'hello', password_confirmation: 'hello' }, { username: 'Rusty', email: 'shackleford@gmail.com', password: 'hello', password_confirmation: 'hello' }])

restaurants = Restaurant.create([{ name: 'McDonalds' }, { name: 'Wendys' }, { name: 'Culvers' }])

reviews = Review.create([{ user_id: '1', restaurant_id: '1', content: 'HAPPY!' }, { user_id: '2', restaurant_id: '2', content: 'Best place everrr' }, { user_id: '3', restaurant_id: '3', content: 'I wish I could live here' }])
