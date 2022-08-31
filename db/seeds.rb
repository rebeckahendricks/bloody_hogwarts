# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Course.destroy_all
Student.destroy_all

@student1 = Student.create!(name: 'Casseopia Black', age: 14, house: 'Slytherin')
  @dark_arts = @student1.courses.create!(name: "Defense against the Dark Arts")
  @herbology = @student1.courses.create!(name: "Herbology")
  @potions = @student1.courses.create!(name: "Potions")

@student2 = Student.create!(name: 'Harry Potter', age: 14, house: 'Gryffindor')
@student3 = Student.create!(name: 'Luna Lovegood', age: 13, house: 'Ravenclaw')
