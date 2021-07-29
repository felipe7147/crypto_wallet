namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Excluindo Banco de Dados")
      spinner.auto_spin # Automatic animation with default interval
      %x(rails db:drop:_unsafe)
      spinner.success("(Concluido com sucesso!!)")

      spinner = TTY::Spinner.new("[:spinner] Criando Banco de Dados")
      spinner.auto_spin # Automatic animation with default interval
      %x(rails db:create) 
      spinner.success("(Concluido com sucesso!!)")

      spinner = TTY::Spinner.new("[:spinner] Migrando Banco de Dados")
      spinner.auto_spin # Automatic animation with default interval
      %x(rails db:migrate) 
      spinner.success("(Concluido com sucesso!!)")

      spinner = TTY::Spinner.new("[:spinner] Populando Banco de Dados")
      spinner.auto_spin # Automatic animation with default interval
      %x(rails db:seed)
      spinner.success("(Concluido com sucesso!!)")
    
    else
     puts "Voçe não está em ambiente de desenvolvimento"
    end
  end

end
