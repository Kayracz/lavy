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

# images = %w(http://res.cloudinary.com/deruwllkv/image/upload/v1542312646/wehfbsghaupq9uyw4jzb.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312650/hvqluwswg35dj3b1orf2.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312652/xzefeunnplvlwetb9xyu.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312654/gpl83ypcvqnrcsz4gcy4.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312656/gbpmr8s1f2yfarijbteu.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312659/hnljwao3yiy6aw3fvfxv.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312661/yraaocf9mwza5ub6v5zk.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312663/pkou5a9c2qb7xitt8qvi.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312666/lhpfqn0oqi2pvw1h0bzg.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312669/xtjg2bacghb5tm5wdlrp.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312670/fqhoy82zsijawcslqrch.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312673/kwrppwjberie1qhxr3m1.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312677/od8whw9vfxgjwahmpnwu.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312680/qlqpa2ilmeauokd51oi7.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312682/x0ouktxfwumvhdidx2ju.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312685/ijtvkqbiiylfyhhp4tel.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312689/rz5zjefz1fsb9usc61ba.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312692/u3b1psizzyvumnp8rsjv.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312695/cxvi5a5fthobohxt6f1h.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312698/zg14t4yqh2cmqdbnk4zx.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312701/fnqk41nux38p6v3lsue0.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312703/micns3v4a5mglcrkhoxx.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312709/sjgsuyxrlyqmjc9h0wah.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312712/s9wyyrtg34wwnssnuzyn.jpg http://res.cloudinary.com/deruwllkv/image/upload/v1542312714/satk8jil4bw0eqryawyi.jpg)

puts "Create new seeds"

  # validates :name, :address, :phone_number, :bags_per_day, presence: true
  # validates :address, presence: true
  # validates :phone_number, presence: true

    # t.bigint "user_id"
    # t.bigint "laundromat_id"
    # t.string "status"
    # t.datetime "pick_up_time"
    # t.datetime "delivery_time"
    # t.string "delivery_address"
    # t.integer "number_of_bags"


2.times do |i|
  laundromat = Laundromat.new(name: "#{i}-Laundromat", address: "#{i}-address", phone_number: "#{i}000000", bags_per_day: "10#{i}")
  laundromat.save!
end

Laundromat.all.each_with_index do |laundromat, i|
  user = User.new(email: "#{i}-user@gmail.com", password: "123456", name: "#{i}-Jack Smith", phone_number: "8379119#{i}", role: true, address: "user-address#{i}")
  user.save!
end

User.all.each_with_index do |user, i|
  order = Order.new(user_id: user.id, laundromat_id: Laundromat.all[i].id, pick_up_guy_id: User.all.reverse[i].id, delivery_guy_id: User.all.reverse[i].id, pick_up_time: Date.today, delivery_time: Date.today + 2, pick_up_address: "#{i}-pick-up-address", delivery_address: "#{i}-delivery-address", number_of_bags: i+1)
  order.save!
end

Order.all.each_with_index do |order|
  review = Review.new(order_id: order.id, stars: 1+rand(5), description: Faker::MostInterestingManInTheWorld.quote)
  review.save!
end


# 2.times do |i|
#   user = User.new(email: "#{i}-user@gmail.com", password: "123456", name: "#{i}-Jack Smith", phone_number: "8379119#{i}", role: true)
#   user.remote_photo_url = "https://res.cloudinary.com/deruwllkv/image/upload/v1542396873/kay.jpg"
#   user.save!
# end

# boat_type = %w(Yatch 'Sail boat' Canoe Launch Houseboat 'Jet boat' Dinghy)

# city = %w(Seattle Miami Ibiza Dakar Manila Mumbai Amsterdam Venice Lisbon Dakhla Ducos Noord Sydney Mumbai Nuuk Cancun Cartagena Montevideo Casablanca Lima)

# User.all.each do |user|

#   25.times do |i|
#     i += 1
#     Boat.create(
#       user: user,
#       name: Faker::Artist.name,
#       location: city.sample,
#       boat_type: boat_type.sample,
#       size: (i * 5),
#       description: Faker::MostInterestingManInTheWorld.quote,
#       capacity: (i * 5),
#       price:  (i * 10),
#       remote_photo_url: images[i]
#     )
#   end
# end

puts "Finished seeding process!"
