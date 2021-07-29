namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_sppiner("Apagando BD...") {%x(rails db:drop:_unsafe) }      
      show_sppiner("Criando Banco de Dados...") { %x(rails db:create) }
      show_sppiner("Migrando Banco de Dados") {%x(rails db:migrate) }
      show_sppiner("Populando Banco de Dados...") {%x(rails db:seed) }    
    else
     puts "Voçe não está em ambiente de desenvolvimento"
    end
  end

  private
  def show_sppiner(msg_start, msg_end = "Concluído!!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin # Automatic animation with default interval
    yield
    spinner.success("(#{msg_end})")
  end

end
