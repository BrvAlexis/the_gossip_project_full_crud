class ProfilController < ApplicationController
  def show
    puts "$" * 60
    puts "Voici le message de l'URL :"
    puts  params[:id]
    puts "$" * 60
    @id = params[:id]
  end
end
