class RecipeTypeController < ApplicationController

  def show
    id = params[:id]
    @recipetype = RecipeType.find(id)
  end
  
  def new
    @recipetypes = RecipeType.new
  end

end