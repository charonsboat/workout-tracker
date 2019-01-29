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
Activity.where(name: 'Snatch').first_or_create!
Activity.where(name: 'Overhead Squat').first_or_create!
Activity.where(name: 'Squat Clean').first_or_create!
Activity.where(name: 'Sumo Deadlift').first_or_create!
Activity.where(name: 'Push Up').first_or_create!
Activity.where(name: 'Pull Up').first_or_create!
Activity.where(name: 'Box Jump').first_or_create!
Activity.where(name: 'Double Under').first_or_create!
Activity.where(name: 'Wall Ball').first_or_create!
Activity.where(name: 'Muscle Up').first_or_create!
Activity.where(name: 'Pull Up (C2B)').first_or_create!
Activity.where(name: 'Pull Up (Strict)').first_or_create!
Activity.where(name: 'Thruster').first_or_create!
Activity.where(name: 'Cluster').first_or_create!
Activity.where(name: 'Hang Snatch').first_or_create!
Activity.where(name: 'Rope Climb').first_or_create!
