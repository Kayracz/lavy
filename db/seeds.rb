# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Start seeding process..."
puts "Destroy all old seeds"

Review.destroy_all
Order.destroy_all
User.destroy_all
Laundromat.destroy_all

puts "Create new seeds"

Laundromat_addresses = ["Malabia 1510, Buenos Aires", "Bogado 4547, Buenos Aires", "Lafinur 2988, Buenos Aires", "Pujol 644, Buenos Aires", "Virrey Loreto 2348, Buenos Aires", "Luis María Drago 5681, Buenos Aires", "Av. del Libertador 1201, Buenos Aires", "Av. San Martín 5125, Buenos Aires", "Pergamino 1109, Buenos Aires", "Diagonal Salta 596, Buenos Aires"]
User_addresses = ["Godoy Cruz 2301, Buenos Aires", "Av. Luis María Campos 726, Buenos Aires"]
Laundromat_names = ["Nick's Clean Engineers Club", "Antonio's Clean & Green", "Jamaica Queens Clean Clothes", "The Loiseau Clothes Mansion", "Bubble Rave", "Kayra's Lavy Factory", "Colin's British Laundromat", "Panchi's Laundro-mate", "Tyson's Garment Rinse", "Art of the Machine"]

laundromat_images_url_extension = ["v1543292071/orrm3xutt5bje82z9zpl.jpg", "v1543292188/wa8dvl1iqppzw0yiqimv.jpg", "v1543292251/ww0gajviglryt6mqvm1l.jpg", "v1543292310/afruzs21gt77zm9ljitd.jpg", "v1543292355/yucaj2uuebpnejrokfjk.jpg", "v1543292381/bdxmxrciogrmgba5ni0p.jpg","v1543292409/ud0o4vzhjhwddzxbzi0g.jpg","v1543292429/rv5eg9s75ej7gkm798bf.jpg","v1543292450/tgvwshwjfhprx4awnbih.jpg", "v1543292777/xjhi4d8nshfqnfduhfml.jpg"]
price_per_bag = [10000, 5000, 9000, 12000, 25000, 18000, 8000, 11000, 22000, 14000]

10.times do |i|
  laundromat = Laundromat.new(name: Laundromat_names[i], address: Laundromat_addresses[i], phone_number: "#{i}000000", bags_per_day: "10#{i}", price_cents: price_per_bag[i], remote_photo_url: "https://res.cloudinary.com/deruwllkv/image/upload/" + laundromat_images_url_extension[i])
  laundromat.save!
end

2.times do |i|
  user = User.new(email: "#{i}-user@gmail.com", password: "123456", name: "#{i}-Jack Smith", phone_number: "8379119#{i}", role: true, address: User_addresses[i])
  user.save!
end

Laundromat.all.each_with_index do |laundromat, i|
  5.times do  |j|
    order = Order.new(
      user: User.all.sample,
      laundromat: laundromat,
      pick_up_guy: User.all.sample,
      delivery_guy: User.all.sample,
      pick_up_time: Date.today + j, delivery_time: Date.today + j + 1 + rand(7),
      address: User_addresses[i],
      number_of_bags: i+1,
      status: 'pending'
    )
    order.save!
  end
end

Order.all.each_with_index do |order|
  review = Review.new(order: order, stars: 1+rand(5), description: Faker::MostInterestingManInTheWorld.quote)
  review.save!
end

puts "Finished seeding process!"
