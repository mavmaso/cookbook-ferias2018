class RecipeType < ApplicationRecord
  has_many :recipes
  validates :name, presence: { message:'Você deve informar o nome do tipo de receita'}
  #validates :name, uniqueness: { message: 'Tipo de receita já cadastrado'}
  end
