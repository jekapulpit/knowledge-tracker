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

# Answer.destroy_all
# Question.destroy_all
# Test.destroy_all
# Technology.destroy_all
# User.destroy_all

[
    {
        username: 'fcbb99',
        password: '123456',
        email: 'fcbb99@mail.ru',
        confirmed_at: '2018-12-31 15:32:10'
    },
    {
        username: 'fcbb98',
        password: '123456',
        email: 'fcbb98@mail.ru',
        confirmed_at: '2018-12-31 15:32:10'
    },
    {
        username: 'fcbb97',
        password: '123456',
        email: 'fcbb97@mail.ru',
        confirmed_at: '2018-12-31 15:32:10'
    }
].each do |user_attributes|
  User.create(user_attributes)
end

[
    {
        title: 'c++',
        discription: Faker::Company.bs,
    },
    {
        title: 'c#',
        discription: Faker::Company.bs,
    },
    {
        title: 'JavaScript',
        discription: Faker::Company.bs,
    },
    {
        title: 'Ruby',
        discription: Faker::Company.bs,
    }
].each do |technology_params|
  tech = Technology.create(technology_params)
  num_of_tests = Faker::Number.between(5, 15)
  num_of_tests.times do
    test = Test.create(title: Faker::Company.bs, discription: Faker::Company.bs)
    10.times do
      question = Question.new(question_text: Faker::Lorem.sentence(3))
      4.times do
        answer = Answer.create(answer_text: Faker::Company.bs)
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
