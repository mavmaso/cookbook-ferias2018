class Recipe < ApplicationRecord
  belongs_to :cuisine
  validates :title, :recipe_type, :difficulty, :ingredients, :cook_time, 
            :cook_method, presence: { message: "Você deve informar todos os dados da receita"}
          

end
