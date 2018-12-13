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

Users = User.create([{ :username => 'fcbb99', :password => '123456', :email => 'fcbb99@mail.ru', :confirmed_at => '2018-12-31 15:32:10' },
                     { :username => 'fcbb98', :password => '123456', :email => 'fcbb98@mail.ru', :confirmed_at => '2018-12-31 15:32:10' },
                     { :username => 'fcbb97', :password => '123456', :email => 'fcbb97@mail.ru' },
                     { :username => 'fcbb96', :password => '123456', :email => 'fcbb96@mail.ru' },
                     { :username => 'fcbb95', :password => '123456', :email => 'fcbb95@mail.ru' }])