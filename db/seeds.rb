# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Start seeding process..."
puts "Create new seeds"

Laundromat_addresses = ["Malabia 1510, Buenos Aires", "Bogado 4547, Buenos Aires", "Lafinur 2988, Buenos Aires", "Pujol 644, Buenos Aires", "Virrey Loreto 2348, Buenos Aires", "Luis María Drago 5681, Buenos Aires", "Av. del Libertador 1201, Buenos Aires", "Av. San Martín 5125, Buenos Aires", "Pergamino 1109, Buenos Aires", "Diagonal Salta 596, Buenos Aires", "Gorriti 5176, Buenos Aires", "Av. Medrano 1475, Buenos Aires"]
Laundromat_names = ["Nick's Clean Engineers Club", "Antonio's Clean & Green", "Sam & Bruno's Brazilian Wash", "The Loiseau Clothing Castle", "Sebas' Bubble Rave", "Kayra's Lavy Factory", "Colin's British Laundromat", "Panchi's Laundro-mate", "Tyson's Garment Rinse", "Art of the Machine"]
Laundromat_phone_numbers = ["+011 4631-4955", "+011 4231-4554", "+011 6731-7554", "+011 9831-0213", "+011 4503-2323", "+011 0803-2303", "+011 0531-2142", "+011 0421-1142","+011 4503-2323", "+011 9003-1723"]
Laundro_bags_per_day = ["130", "122", "171", "200", "123", "190", "145", "94", "142", "142"]

Laundromat_lat = [-34.5912141428571, -34.6048750734694, -34.5807452, -34.6150285714286, -34.5669256090909, -34.5886748,-34.5223471, -34.5957008, -34.6442688163265, -34.4922742061224, -34.5884584,-34.5877428]
Laundromat_lng = [-58.4279213469388, -58.4296872877551, -58.4147393, -58.4483242857143, -58.4495260414141, -58.3928557,-58.4732622, -58.4887189, -58.4675740612245, -58.5076535653061, -58.4351859,-58.4344577]

addresses = []
Laundromat_addresses.each_with_index do |a, index|
 addresses << {address: a, lat: Laundromat_lat[index], lng: Laundromat_lng[index]}
end


REVIEW_DESCRIPTION = ["Ok... starting to feel like a laundromat aficionado--
But-- THIS PLACE IS REALLY NICE.", "It's a laundromat-- but!  It's clean.", "The machines are clearly maintained and up to date.", "The worker when I went was a friendly, very chatty Filipino lady.", "This is not the closest laundromat to where I live, but I will definitely be going back.",
"5 stars for a laundromat?! Yup! I really like the place! Totally recommended!", "I never review places, much less laundry mats. But this has earned it.", "Basically, these guys have upped the laundro-game to untold heights. What does this mean for you dear reader?"]


# User_names = ["Jack Smith", "Daniel Hernandez"]
# User_addresses = ["Godoy Cruz 2301, Buenos Aires", "Av. Luis María Campos 726, Buenos Aires"]
# User_numbers = ["+011 0303-9123", "+011 0432-4240"]
daniel = {
email: "danielhernandez@gmail.com",
password: "123456",
name: "Daniel Hernandez",
phone_number: "+011 0432-4240",
role: true,
address: Laundromat_addresses[-1]
}

jack = {
email: "jacksmith@gmail.com",
password: "123456",
name: "Jack Smith",
phone_number: "+011 0303-9123",
role: true,
address: Laundromat_addresses[-2]
}

godoy = {

}

laundromat_images_url_extension = ["v1543292071/orrm3xutt5bje82z9zpl.jpg", "v1543292188/wa8dvl1iqppzw0yiqimv.jpg", "v1543292251/ww0gajviglryt6mqvm1l.jpg", "v1543292310/afruzs21gt77zm9ljitd.jpg", "v1543292355/yucaj2uuebpnejrokfjk.jpg", "v1543292381/bdxmxrciogrmgba5ni0p.jpg","v1543292409/ud0o4vzhjhwddzxbzi0g.jpg","v1543292429/rv5eg9s75ej7gkm798bf.jpg","v1543292450/tgvwshwjfhprx4awnbih.jpg", "v1543292777/xjhi4d8nshfqnfduhfml.jpg"]
price_per_bag = [10000, 5000, 9000, 12000, 25000, 18000, 8000, 11000, 22000, 14000]

10.times do |i|
  laundromat = Laundromat.new(name: Laundromat_names[i], address: Laundromat_addresses[i], phone_number: Laundromat_phone_numbers[i], bags_per_day: Laundro_bags_per_day[i], price_cents: price_per_bag[i], remote_photo_url: "https://res.cloudinary.com/deruwllkv/image/upload/" + laundromat_images_url_extension[i])
  laundromat.save!
end


user_daniel = User.new(daniel)
user_daniel.save!

user_jack = User.new(jack)
user_jack.save!

Orders_a = ["Av. Federico Lacroze 2239, Buenos Aires", "Av. Elcano 3288, Buenos Aires"]
Order_lat = [-34.5682233, -34.5740684]
Order_lng = [-58.4434002, -58.4595863]

# Order_addresses = []
# end

Laundromat.all.each_with_index do |laundromat, i|
  2.times do  |j|
    order = Order.new(
      user: user_jack,
      laundromat: laundromat,
      pick_up_guy: user_daniel,
      delivery_guy: user_daniel,
      pick_up_time: Date.today + j, delivery_time: Date.today + j + 1 + rand(7),
      address: Orders_a[j],
      # latitude: Order_addresses[i][:lat],
      # longitude: Order_addresses[i][:lng],
      number_of_bags: i+1,
      status: 'pending'
    )
    order.save!
  end
end



Order.all.each_with_index do |order, index|

    review1 = Review.new(
      order: order,
      stars: rand(1..5),
      description: REVIEW_DESCRIPTION.sample
    )

  review1.save!

  review2 = Review.new(
    order: order,
    stars: rand(1..5),
    description: REVIEW_DESCRIPTION.sample
  )

  review2.save!
end



puts "Finished seeding process!"
