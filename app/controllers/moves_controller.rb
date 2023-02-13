class MovesController < ApplicationController
  def index
    @moves = Move.all 
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
    redirect_to move_path(@move)
  end

  def edit
    @move = Move.find(params[:id])
  end

  def update
    @move = Move.find(params[:id])
    @move.update(move_params)
    redirect_to move_path(@move)
    
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

end
