# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


properties = [{name: "Chapin strett 102", apttype: "House", description: "Lorem ipsum", price: 200000, address: "Lorem ipsum avenue 32, NY", status: "Leased"},
            {name: "Murray street 56", apttype: "Apartment", description: "Lorem ipsum", price: 200000, address: "Lorem ipsum avenue 32, NY", status: "Leased"},
            {name: "Leroy strett 102", apttype: "Apartment", description: "Lorem ipsum", price: 200000, address: "Lorem ipsum avenue 32, NY", status: "Leased"},
            {name: "State strett 102", apttype: "Apartment", description: "Lorem ipsum", price: 200000, address: "Lorem ipsum avenue 32, NY", status: "Leased"},
            {name: "Court strett 102", apttype: "Apartment", description: "Lorem ipsum", price: 200000, address: "Lorem ipsum avenue 32, NY", status: "Leased"},
            {name: "Front strett 102", apttype: "Apartment", description: "Lorem ipsum", price: 200000, address: "Lorem ipsum avenue 32, NY", status: "Leased"},
            {name: "Cedar street 109", apttype: "House", description: "Lorem ipsum", price: 200000, address: "Lorem ipsum avenue 32, NY", status: "Leased"},
            {name: "Oak strett 102", apttype: "House", description: "Lorem ipsum", price: 200000, address: "Lorem ipsum avenue 32, NY", status: "Leased"},
            {name: "Katherene strett 102", apttype: "House", description: "Lorem ipsum", price: 200000, address: "Lorem ipsum avenue 32, NY", status: "Leased"},
            ]

properties.each do |property|
  Property.create!(property)
end

#p "Created #{Properties.count} properties"