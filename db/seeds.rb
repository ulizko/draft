# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category1 = Category.create(name: 'Programming languages.', description: 'All about programming languages')
category2 = Category.create(name: 'Expensive cars.', description: 'All about expensive cars')

post1 = Post.create(name: 'Ruby is cool.', content: 'Ruby is cool ' * 10, category: category1)
post2 = Post.create(name: 'Ferrari the fastest car.', content: 'Ferrari the fastest car ' * 10, category: category2)
