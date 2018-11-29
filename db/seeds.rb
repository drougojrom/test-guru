# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat = Category.create!(title: 'Backend')
cat2 = Category.create!(title: 'Data')
user = User.create!(first_name: 'User', last_name: 'New', email: 'test1@test.com', password: '123asdaA', password_confirmation: '123asdaA', type: 'Admin')
test = Test.create!(title: 'Ruby', level: 1, category: cat, author: user)
test2 = Test.create!(title: 'Machine learning', level: 1, category: cat2, author: user)
question = Question.create!(body: 'How to create a migration?', test: test)
question2 = Question.create!(body: 'How to create a migration 2?', test: test)
question3 = Question.create!(body: 'What is machine learning', test: test2)
question4 = Question.create!(body: 'What is machine learning 2?', test: test2)
Answer.create!(text: 'Rails g migration', question: question, correct: true)
Answer.create!(text: 'Rails g model', question: question)
Answer.create!(text: 'Rails g migration2', question: question2, correct: true)
Answer.create!(text: 'Rails g model2', question: question2)
Answer.create!(text: 'Rails g model2', question: question3, correct: true)
Answer.create!(text: 'Rails g model2', question: question3)
Answer.create!(text: 'Rails g model2', question: question4, correct: true)
Answer.create!(text: 'Rails g model2', question: question4)

