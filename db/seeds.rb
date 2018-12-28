# This file should contain all the record creation
# needed to seed the database with its default values.
# The data can then be loaded with the rails
# db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#
require 'faker'

Answer.destroy_all
Question.destroy_all
Test.destroy_all
Technology.destroy_all
User.destroy_all

users = [
    ['fcbb99', '123456', 'fcbb99@mail.ru', '2018-12-31 15:32:10'],
    ['fcbb99', '123456', 'fcbb99@mail.ru', '2018-12-31 15:32:10'],
    ['fcbb99', '123456', 'fcbb99@mail.ru', '2018-12-31 15:32:10'],
    ['fcbb99', '123456', 'fcbb99@mail.ru', '2018-12-31 15:32:10'],
    ['fcbb99', '123456', 'fcbb99@mail.ru', '2018-12-31 15:32:10']
]

technologies = [
    ['c++', Faker::Company.bs],
    ['tech2', Faker::Company.bs],
    ['tech3', Faker::Company.bs],
    ['tech4', Faker::Company.bs],
    ['tech5', Faker::Company.bs]
]

users.each do |uname, passw, email, crat|
  User.create( username: uname, password: passw, email: email, confirmed_at: crat )
end

technologies.each do |title, discr|
  tech = Technology.create( title: title, discription: discr )
  num_of_tests = Faker::Number.between(5, 15)
  num_of_tests.times do |test_index|
    test = Test.create( title: Faker::Company.bs, discription: Faker::Company.bs)
    10.times do |question_index|
      question = Question.new( question_text: Faker::Lorem.sentence(3) )
      4.times do |ans_index|
        answer = Answer.create( answer_text: Faker::Company.bs )
        question.answers << answer
      end
      test.questions << question
    end
    tech.tests << test
  end
end

Question.all.each do |question|
  right_answer_index = Faker::Number.between(0, 3)
  question.answers.each_with_index do |answer, answer_index|
    question.right_answer = answer.id if answer_index == right_answer_index
    question.save
  end
end
