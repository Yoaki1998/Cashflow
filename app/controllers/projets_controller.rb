class ProjetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create, :index, :completion]
  before_action :find_projet, only: [:update,:edit,:destroy]
  
  def index
    @user.projets.all
    loading_plus_month()
    payed()
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
  
  def completion 
    @projet = Projet.find(params[:projet_id])
    if @projet.load == 100 
      @projet.complete = true
      @user.liquidity -= @projet.amount
      @projet.save
      @user.save
    end
    redirect_to projets_path
  end 

  #------------------------------------------------------------------------------------------------------------
  private

  def payed 
    expense = 0
    @user.projets.find_all{|projet| projet.complete == true}.each do |projet|
      expense += projet.amount 
    end
    @user.p_expense = expense
    @user.save
  end 

  def loading_plus_month
    liquid = @user.liquidity
    stocker = 0
    @user.projets.sort{ |a, b| a.priority <=> b.priority }.find_all{|projet| projet.complete == false}.each do |projet|
      if liquid - projet.amount >= 0 
        liquid -= projet.amount
        projet.month_left = 0
        projet.load = 100
        projet.save
      else 
        projet.month_left = @user.cashflow >= 0 ? (( projet.amount - liquid ) / @user.cashflow ) + stocker : 999
        stocker = projet.month_left
        projet.load = (liquid / projet.amount) * 100
        liquid = 0
        projet.save
      end
    end
  end


  
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
