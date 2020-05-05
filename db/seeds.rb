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
rare_mons = [1,2,4,5,7,8,10,11,12,13,14,15,17,16,19,20,21,22,23,24,27,28,29,30,32,33,35,36,37,39,40,41,
  42,43,44,46,47,48,49,50,51,52,53,54,55,56,57,58,60,61,62,63,64,66,67,69,70,71,72,73,74,75,77,78,79,
  80,81,82,83,84,85,86,87,88,89,90,91,92,93,95,96,97,98,99,100,101,102,103,104,105,108,109,110,111,114,
  115,116,117,118,119,120,121,129,133,147]
epic_mons = [3,6,9,18,25,26,31,34,38,45,59,65,68,76,94,106,107,112,113,122,123,124,125,126,127,128,130,131,132,134,135,136,137,138,139,140,141,148]
legendary_mons = [142,143,144,145,146,149,150,151]
monsters_list = [rare_mons,epic_mons,legendary_mons]

monsters_list.each do |array|
  array.each do |i|
    url = "https://pokeapi.co/api/v2/pokemon/#{i}/"

    resp = RestClient.get(url)
    json_resp = JSON.parse(resp) 

    name = json_resp["species"]["name"]
    img_url = "./assets/ani-front/#{name}.gif"
    Monster.create(name: name, level: 1, img_url: img_url)
  end 
end

puts "Rare monsters : #{rare_mons.count}" #105 rare monsters ID: 1-105
puts "Epic monsters : #{epic_mons.count}" #38 epic monsters ID: 106-143
puts "Legendary monsters : #{legendary_mons.count}" #8 legendaries ID: 144 - 151
puts "Total monsters : #{Monster.count}"

Item.create(name: "Tamago", price: 1000, description: "Summon a random monster!", img_url: "./assets/mario-gif/tamago_egg")
Item.create(name: "Lady Egga", price: 50000, description: "Summon a random Epic and higher monster!", img_url: "./assets/mario-gif/lady_egga_egg")
Item.create(name: "Pikapika Egg", price: 100000, description: "Summon a LEGENDARY Monster!", img_url: "./assets/mario-gif/pikapia_egg")

Inventory.create(item: Item.first, user: User.first)
Summon.create(monster: Monster.first, user: User.first)

puts "finished seeding"