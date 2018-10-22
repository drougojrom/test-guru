# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Test.create!(title: 'Ruby', level: 1)
Question.create!(body: 'How to create a migration?')
Response.create!(response: 'No answer')
Category.create!(title: 'Backend')
User.create!(name: 'User 1', email: 'test1@test.com')
