# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
STATUSES = [
    'started',
    'inprogress',
    'completed'
]

5.times do
  Trip.create({
      driver: Faker::Name.name,
      location: [Faker::Address.street_name],
      start_at: Faker::Time.backward(14, :evening),
      completed_at: Faker::Time.forward(23, :morning),
      state: STATUSES.sample

  })
end