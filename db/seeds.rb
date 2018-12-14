# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Activity.where(name: 'Squat').first_or_create!
Activity.where(name: 'Front Squat').first_or_create!
Activity.where(name: 'Deadlift').first_or_create!
Activity.where(name: 'Power Clean').first_or_create!
Activity.where(name: 'Bench Press').first_or_create!
