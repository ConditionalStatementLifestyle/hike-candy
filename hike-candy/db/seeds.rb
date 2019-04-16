# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create(first_name: 'Jon', last_name: 'apple', username: 'donboy987')
User.create(first_name: 'Quinn', last_name: 'Vox', username: 'Voxboy987')
User.create(first_name: 'Abe', last_name: 'dude', username: 'abeboy987')
User.create(first_name: 'Doug', last_name: 'wort', username: 'Doug987')
