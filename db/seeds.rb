# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gift = Gift.create(name: 'Dyson v7', description: 'A very nice cordless vacuum cleaner', price: 50_000, image_url: 'sample/dyson-v7.jpg')
guest1 = Guest.create(name: 'Ruben Arakelyan', email_address: 'ruben@arakelyan.uk')
guest2 = Guest.create(name: 'Joanna Ireland', email_address: 'joanna@example.com')
PurchasedGift.create(gift: gift, guest: guest1, paid: 25_000, message: 'Have a great day!')
PurchasedGift.create(gift: gift, guest: guest2, paid: 10_000, message: 'Me too!')
