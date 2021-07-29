# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas...")
spinner.auto_spin 

coins = [
	  	 {
		  description: "Bitcoin",
		  acronym: "BTC",
		  url_image: "https://image.flaticon.com/icons/png/512/3342/3342766.png"
		},

		{
		  description: "Ethereum",
		  acronym: "ETH",
		  url_image: "https://th.bing.com/th/id/R.e2a12cefdfb666cacd6fde11f6a19104?rik=SeNdhJbSfPQsZw&pid=ImgRaw"
		},

		{
		   description: "Dash",
		   acronym: "DASH",
		   url_image: "https://i.pinimg.com/originals/99/81/52/99815216c69f59d6bb1322de48a38aae.png"
		},

		{
			description: "DogeCoin",
			acronym: "DGC",
			url_image: "https://th.bing.com/th/id/OIP.Q2nZOE1TrgBfHantVQQiqwHaHa?pid=ImgDet&rs=1"
	}
	]

 coins.each do |coin|
	Coin.find_or_create_by!(coin)
 end

spinner.success("(Concluído)")