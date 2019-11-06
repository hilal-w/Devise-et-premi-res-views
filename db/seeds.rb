# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Event.destroy_all
puts "Tous les users sont supprimer"
begin
20.times do |i|
  user=User.new
  user.first_name = Faker::JapaneseMedia::OnePiece.character
  user.last_name = Faker::JapaneseMedia::DragonBall.character
  user.email = SecureRandom.urlsafe_base64 + "@yopmail.com"
  user.password = SecureRandom.urlsafe_base64
  user.description = Faker::Movies::HitchhikersGuideToTheGalaxy.quote
  user.save
  puts "#{i*5+1}%"
end
puts "Tous les users sont crée"
20.times do |j|
  event = Event.new
  event.start_date = DateTime.now + rand(1..9)
  event.duration = 55
  event.description = "#{Faker::Movies::HitchhikersGuideToTheGalaxy.quote}"*4
  event.title = Faker::JapaneseMedia::DragonBall.character
  event.price = rand(1..1000)
  event.location = Faker::JapaneseMedia::OnePiece.character
  event.admin_id = rand(User.first.id .. User.last.id)
  event.save
  puts "#{j*5+1}"
end
puts "Tous les events son crée"
