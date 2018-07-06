class RecipeTypesController < ApplicationController

  def show
    id = params[:id]
    @recipetype = RecipeType.find(id)
  end
  
  def new
    @recipetype = RecipeType.new
  end

  def create
    @recipetype = RecipeType.new(recipe_type_params)
    if @recipetype.save 
      redirect_to @recipetype
    else
      render 'new'
    end
  end

private

def recipe_type_params
  params.require(:recipe_type).permit(:name)
end

end