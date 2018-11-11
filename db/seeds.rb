# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat = Category.create!(title: 'Backend')
user = User.create!(name: 'User 1', email: 'test1@test.com', password: '123asdaA', password_confirmation: '123asdaA')
test = Test.create!(title: 'Ruby', level: 1, category: cat, author: user)
question = Question.create!(body: 'How to create a migration?', test: test)
question2 = Question.create!(body: 'How to create a migration 2?', test: test)
Answer.create!(text: 'Rails g migration', question: question, correct: true)
Answer.create!(text: 'Rails g model', question: question)
Answer.create!(text: 'Rails g migration2', question: question2, correct: true)
Answer.create!(text: 'Rails g model2', question: question2)
