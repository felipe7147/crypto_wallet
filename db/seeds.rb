# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando Moedas..."

Coin.create!(
	description: "Bitcoin",
	acronym: "BTC",
	url_image: "https://image.flaticon.com/icons/png/512/3342/3342766.png"
)

Coin.create!(
	description: "Ethereum",
	acronym: "ETH",
	url_image: "https://th.bing.com/th/id/R.e2a12cefdfb666cacd6fde11f6a19104?rik=SeNdhJbSfPQsZw&pid=ImgRaw"
)

Coin.create!(
	description: "Dash",
	acronym: "DASH",
	url_image: "https://i.pinimg.com/originals/99/81/52/99815216c69f59d6bb1322de48a38aae.png"
)

Coin.create!(
	description: "DogeCoin",
	acronym: "DGC",
	url_image: "https://th.bing.com/th/id/OIP.Q2nZOE1TrgBfHantVQQiqwHaHa?pid=ImgDet&rs=1"
)

puts "Moedas Cadastradas com Sucesso!!"