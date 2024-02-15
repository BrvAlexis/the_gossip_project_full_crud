class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id # Login l'utilisateur après l'inscription
          redirect_to root_path, notice: 'Inscription réussie !'
        else
             # Ajoutez cette ligne pour afficher les erreurs
    puts @user.errors.full_messages.inspect
          render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id, :password_digest)
    end



end
