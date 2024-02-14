class GossipsController < ApplicationController
  def show
    puts "$" * 60
    puts "Voici le message de l'URL :"
    puts  params[:id]
    puts "$" * 60
    @id = params[:id]
    @gossip = Gossip.find(params[:id])
  end
  
  def index
    @gossip = Gossip.all
  end

  
  def new
    @gossip = Gossip.new
  end

  def create
    
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.find_by(first_name: "anonymous")
  
    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to root_path, notice: 'The super potin was successfully saved!'# si ça marche, il redirige vers la page d'index du site
    else
      render 'new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

 
  private

    def gossip_params
      params.permit(:title, :content)
     end
  

end
