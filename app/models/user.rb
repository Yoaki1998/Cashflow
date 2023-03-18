class User < ApplicationRecord
  #Ex:- :default =>''
  has_many :moves
  has_many :projets

  validates :first_name, uniqueness: true
  validates :last_name, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
end
