# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Properties.create!([{
      name: "Chapin strett 102",
      type: "House",
      description: "Lorem ipsum",
      price: 200000,
      address: "Lorem ipsum avenue 32, NY",
      status: "Leased"
}])

p "Created #{Properties.count} properties"