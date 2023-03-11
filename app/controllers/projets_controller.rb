class ProjetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create, :index]
  before_action :find_projet, only: [:update,:edit,:destroy]
  
  def index
    @user.projets.all
  end

  def new
    @projet = Projet.new
  end

  def create
    @projet = Projet.new(projet_params)
    @projet.user_id = @user.id
    @projet.save
    redirect_to projets_path
  end

  def update
    @projet.update(projet_params)
    redirect_to projets_path
  end

  def destroy
    puts @projet.name
    @projet.destroy
    redirect_to projets_path, status: :see_other
  end

  def show
    redirect_to projets_path
  end

  def edit
  end
#------------------------------------------------------------------------------------------------------------
private

  def projet_params
    params.require(:projet).permit(:name, :priority, :amount)
  end

  def find_projet
    @projet = Projet.find(params[:id])
  end

  def  set_user 
    @user = current_user
  end

end
