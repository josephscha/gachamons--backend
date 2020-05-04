# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

Monster.destroy_all
User.destroy_all
Inventory.destroy_all
Item.destroy_all
Summon.destroy_all

User.create(username: "Red", nickname: "Pink", gender: "male", balance: 1000000, img: "https://cdn.bulbagarden.net/upload/2/2b/Red_PO.png" )
50.times do |i|
  url = "https://pokeapi.co/api/v2/pokemon/#{i + 1}/"

  resp = RestClient.get(url)
  json_resp = JSON.parse(resp) 

  name = json_resp["species"]["name"]
  img_url = "./assets/ani-front/#{name}.gif"
  Monster.create(name: name, level: 1, img_url: img_url)
end 

Item.create(name: "Tamago", price: 1000)
Item.create(name: "Lady Egga", price: 50000)
Item.create(name: "Pikapika Egg", price: 100000)

Inventory.create(item: Item.first, user: User.first)
Summon.create(monster: Monster.first, user: User.first)

puts "finished seeding"