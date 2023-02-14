class MovesController < ApplicationController

  before_action :set_user, only: [:create, :index]
  before_action :find_move, only: [:show, :edit, :update, :destroy]

  def index
    @moves = Move.all 
    cashflow()
    epargne()
    epargne_goal()
  end

  def show
  end

  def new
    @move = Move.new
  end
  
  def create
    @move = Move.new(move_params)
    @move.user_id = @user.id
    @move.save
    redirect_to moves_path
  end

  def edit
  end

  def update
    @move.update(move_params)
    redirect_to moves_path
    
  end

  def destroy
    @move.destroy
    redirect_to move_path(@move),status: :see_other
  end


  private

  def move_params
    params.require(:move).permit(:name, :version, :amount)
  end

  def cashflow
    cf = 0
    Move.all.each { |move| cf += move.amount}
    @user.cashflow = cf
    @user.save  
  end

  def epargne
    ep = 0
    Move.all.each do |move| 
      move.version == "epargne" ? ep += move.amount : ""
    end
    @user.epargne = ep
    @user.save 
  end

  def epargne_goal
    revenu = 0
    Move.all.each do |move|
      move.amount > 0 ? revenu += move.amount : "" 
    end
    @goal = revenu * 0.2  
  end

  def set_user
    @user = current_user
  end

  def find_move
    @move = Move.find(params[:id])
  end  

end
