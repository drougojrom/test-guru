# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat = Category.create!(title: 'Backend')
user = User.create!(name: 'User 1', email: 'test1@test.com')
test = Test.create!(title: 'Ruby', level: 1, category: cat, author: user)
question = Question.create!(body: 'How to create a migration?', test: test)
Answer.create!(text: 'No answer', question: question)
