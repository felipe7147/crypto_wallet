namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") {%x(rails db:drop:_unsafe) }      
      show_spinner("Criando Banco de Dados...") { %x(rails db:create) }
      show_spinner("Migrando Banco de Dados") {%x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      
    else
     puts "Voçê não está em ambiente de desenvolvimento"
    end
  end



    desc "Cadastra as Moedas"
    task add_coins: :environment do
      show_spinner("Cadastrando Moedas...") do

    coins = [
           {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://image.flaticon.com/icons/png/512/3342/3342766.png",
          mining_type: MiningType.find_by(acronym: 'PoW')
        },

        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://th.bing.com/th/id/R.e2a12cefdfb666cacd6fde11f6a19104?rik=SeNdhJbSfPQsZw&pid=ImgRaw",
          mining_type: MiningType.all.sample
        },

        {
           description: "Dash",
           acronym: "DASH",
           url_image: "https://i.pinimg.com/originals/99/81/52/99815216c69f59d6bb1322de48a38aae.png",
          mining_type: MiningType.all.sample
        },

        {
          description: "DogeCoin",
          acronym: "DGC",
          url_image: "https://th.bing.com/th/id/OIP.Q2nZOE1TrgBfHantVQQiqwHaHa?pid=ImgDet&rs=1",
          mining_type: MiningType.all.sample
      }
      ]
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]
      
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end


  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end
end