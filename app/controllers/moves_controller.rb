class MovesController < ApplicationController
  #Crée une instance d'utilisateur
  before_action :set_user, only: [:create, :index]
  #Trouve un move a partir d'un ID
  before_action :find_move, only: [:show, :edit, :update, :destroy]

  #Affiche tout les moves appartenant a l'utilisateur actuellement connecté + invoque les fonction neccésaire sur la home page
  def index
    @moves = []
    Move.all.each { |move| verif_user(move) && verif_date(move) ? @moves << move : "" }
    cashflow()
    epargne_goal()
    scrapping_euro()
    dataset(@moves)
  end

  def show
  end

  def new
    @move = Move.new
  end
  
  #Crée un nouveau move ( mouvement d'argent ) et l'enregiste en BDD + redirige sur la home
  def create
    @move = Move.new(move_params)
    @move.date = DateTime.now
    @move.user_id = @user.id
    puts @move
    @move.save
    redirect_to moves_path
  end

  def edit
  end

  #Update un move ( mouvement d'argent ) + redirige sur la home
  def update
    @move.update(move_params)
    @move.updated_at = DateTime.now
    redirect_to moves_path
    
  end

  #Detruit un nouveau move ( mouvement d'argent ) + redirige sur la home
  def destroy
    @move.destroy
    redirect_to move_path(@move),status: :see_other
  end

  #Recupère le taux de change de l'euro sur Google Finance
  def scrapping_euro
    require "open-uri"
    require "nokogiri"

    url = "https://www.google.com/finance/quote/EUR-USD"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML.parse(html_file)

    html_doc.search(".fxKbKc").each do |element|
      @veuro = element.text.strip
    end
  end

  def dataset(moves)
    @data = []
    moves.each do |move|
      @data << [move.created_at.month,move.amount]
    end
  end

#------------------------------------------------------------------------------------------------------------------------------------#
private



  #Verification avec des paramètre fort
  def move_params
    params.require(:move).permit(:name, :version, :amount, :taux)
  end



  #Calcule le cashflow de l'utilisateur actuel et l'enregiste en BDD
  def cashflow
    @user.epargne = 0
    cf = 0
    Move.all.each do |move| 
      if verif_user(move) 
        case move.version
        when "Revenu régulier" 
          cf += move.amount
        when "Revenu ponctuel"
          cf += move.amount
        when "Dépense régulière" 
          cf -= move.amount
        when "Dépense ponctuelle"
          cf -= move.amount
        when "Investissement boursier"
          yearly_g = move.amount * move.taux / 100
          monthly_g = yearly_g * 0.7 / 12
          cf += monthly_g
        when "Epargne"
          cf -= move.amount 
          @user.epargne += move.amount
          @user.save 
        end
      end
    end 
    @user.cashflow = cf
    @user.save  
  end

  #Calcule l'objectif d'épargne de l'utilisateur actuel
  def epargne_goal
    revenu = 0
    Move.all.each do |move|
      ["Revenu ponctuel","Revenu régulier"].include?(move.version) && verif_user(move)  ? revenu += move.amount : "" 
      yearly_g = move.amount * move.taux / 100
      monthly_g = yearly_g * 0.7 / 12
      "Investissement boursier" == move.version ? revenu += monthly_g : "" 
    end
    @goal = (revenu * 6).truncate 
  end

  # Verifie que la date est celle du mois actuelle + Actualise la date des moves régulier
  def verif_date(move)
    if move.date.to_date.month != DateTime.now.to_date.month && ['Revenu régulier','Dépense régulière','Investissement boursier'].include?(move.version)
      move.update( date: DateTime.now )
    end   
    move.date.to_date.month == DateTime.now.to_date.month
  end 

  def set_user
    @user = current_user
  end

  def find_move
    @move = Move.find(params[:id])
  end  

  def verif_user(move)
    move.user_id == current_user.id
  end  


end
