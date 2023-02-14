class MovesController < ApplicationController
  def index
    @moves = Move.all 
    cashflow()
    epargne()
  end

  def show
    @move = Move.find(params[:id])
  end

  def new
    @move = Move.new
  end
  
  def create
    @user = current_user
    @move = Move.new(move_params)
    @move.amount = @move.amount.to_i
    @move.user_id = @user.id
    @move.save
    redirect_to moves_path
  end

  def edit
    @move = Move.find(params[:id])
  end

  def update
    @move = Move.find(params[:id])
    @move.update(move_params)
    redirect_to moves_path
    
  end

  def destroy
    @move = Move.find(params[:id])
    @move.destroy
    redirect_to move_path(@move),status: :see_other
  end


  private

  def move_params
    params.require(:move).permit(:name, :version, :amount)
  end

  def cashflow
    cf = 0
    @user = current_user
    Move.all.each do |move|
      cf += move.amount
    end
    @user.cashflow = cf
    @user.save  
  end

  def epargne
    ep = 0
    @user = current_user
    Move.all.each do |move| 
      if move.version == "epargne"
        ep += move.amount
      end
    end
    @user.epargne = ep
    @user.save 
  end
  

end
