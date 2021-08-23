class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - Felipe Almeida [COOKIE]"
    session[:curso] = "Curso de Ruby on Rails - Felipe Almeida [SESSION]"
    @meu_nome = params[:nome]
    @curso = params[:curso]
  end
end
