class GossipsController < ApplicationController
  before_action :authenticate_user
  
  def show
    puts "$" * 60
    puts "Voici le message de l'URL :"
    puts  params[:id]
    puts "$" * 60
    @id = params[:id]
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end
  
  def index
    @gossip = Gossip.all
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    
    if @gossip.update(gossip_params)
  
    
    redirect_to root_path
    else
      render 'edit'
    end

  end
  


  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy(@gossip)
      flash[:success] = "Gossip détruit avec succès !"
    else
      flash[:error] = "Erreur lors de la suppression du Gossip : #{@gossip.errors.full_messages}"
    end
    redirect_to root_path
  end
  

  def create
    
    @gossip = current_user.gossips.build(gossip_params)
  
    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to root_path, notice: 'The super potin was successfully saved!'# si ça marche, il redirige vers la page d'index du site
    else
      render 'new' # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

 
  private

    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
  
  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to root_path
      end
    end
end


