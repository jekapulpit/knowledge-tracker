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
Users = User.create([{ username: 'fcbb99', password: '123456', email: 'fcbb99@mail.ru', confirmed_at: '2018-12-31 15:32:10' },
                     { username: 'fcbb98', password: '123456', email: 'fcbb98@mail.ru', confirmed_at: '2018-12-31 15:32:10' },
                     { username: 'fcbb97', password: '123456', email: 'fcbb97@mail.ru' },
                     { username: 'fcbb96', password: '123456', email: 'fcbb96@mail.ru' },
                     { username: 'fcbb95', password: '123456', email: 'fcbb95@mail.ru' }])

Techs = Technology.create([{ title: 'c++', discription: 'high-level programming language' },
                           { title: 'c#', discription: 'high-level programming language' },
                           { title: 'java-script', discription: 'mostly using for web-apps interactivity' },
                           { title: 'css', discription: 'to make your web-page not ugly' },
                           { title: 'coffee-script', discription: 'i dont know actually what it is' }])

Tests = Techs[3].tests.create([{ title: 'theme 1', discription: 'discription of theme 1' },
                               { title: 'theme 2', discription: 'discription of theme 2' },
                               { title: 'theme 3', discription: 'discription of theme 3' },
                               { title: 'theme 4', discription: 'discription of theme 4' },
                               { title: 'theme 5', discription: 'discription of theme 5' }])

Answers1 = Answer.create([{ answer_text: 'ans1' },
                          { answer_text: 'ans2' },
                          { answer_text: 'ans3' },
                          { answer_text: 'ans4' }])
Answers2 = Answer.create([{ answer_text: 'ans1' },
                          { answer_text: 'ans2' },
                          { answer_text: 'ans3' },
                          { answer_text: 'ans4' }])

Answers3 = Answer.create([{ answer_text: 'ans1' },
                          { answer_text: 'ans2' },
                          { answer_text: 'ans3' },
                          { answer_text: 'ans4' }])

Answers4 = Answer.create([{ answer_text: 'ans1' },
                          { answer_text: 'ans2' },
                          { answer_text: 'ans3' },
                          { answer_text: 'ans4' }])

Questions = Tests[0].questions.create([{ question_text: 'task1' },
                                       { question_text: 'task2' },
                                       { question_text: 'task3' },
                                       { question_text: 'task4' }])

Questions[0].answers = Answers1
Questions[0].right_answer = Answers1[1].id
Questions[0].save
Questions[1].answers = Answers2
Questions[1].right_answer = Answers2[1].id
Questions[1].save
Questions[2].answers = Answers3
Questions[2].right_answer = Answers3[2].id
Questions[2].save
Questions[3].answers = Answers4
Questions[3].right_answer = Answers4[3].id
Questions[3].save
