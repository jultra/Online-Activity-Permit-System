# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.name = 'Hello'
user.surname = 'World'
user.userName = 'Lorem'
user.email = 'test@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'admin'
user.save!

user = User.new
user.name = 'UP Interactive Society'
user.surname = '2017-2018'
user.userName = 'intersoc'
user.email = 'student_org@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'student_org'
user.save!

user = User.new
user.name = 'UP'
user.surname = '2017-2018'
user.userName = 'up'
user.email = 'up@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'student_org'
user.save!


user = User.new
user.name = 'Yuno'
user.surname = 'Romero'
user.userName = 'yuno'
user.email = 'adviser@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'adviser'
user.save!

user = User.new
user.name = 'John'
user.surname = 'Ultra'
user.userName = 'john'
user.email = 'teacher@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'adviser'
user.save!

user = User.new
user.name = 'Ryan'
user.surname = 'Daga'
user.userName = 'rey'
user.email = 'facility@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'facility'
user.save!

user = User.new
user.name = 'John'
user.surname = 'Ultra'
user.userName = 'juan'
user.email = 'employee@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'employee'
user.save!

user = User.new
user.name = 'Richard'
user.surname = 'Balena'
user.userName = 'chard'
user.email = 'osa@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'osa'
user.save!

user = User.new
user.name = 'CMSC 128 - N'
user.surname = '2017-2018'
user.userName = '128-N'
user.email = 'class@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'class'
user.save!

user = User.new
user.name = 'Telesforo'
user.surname = 'Teles'
user.userName = 'sao'
user.email = 'sao@gmail.com'
user.password = 'qwerty'
user.password_confirmation = 'qwerty'
user.add_role 'sao'
user.save!