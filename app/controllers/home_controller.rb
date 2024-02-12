class HomeController < ApplicationController
  def show
    puts "$" * 60
    puts "Voici le message de l'URL :"
    puts  params[:first_name]
    puts "$" * 60
    @first_name = params[:first_name]
    @gossips = Gossip.all
  end
end
