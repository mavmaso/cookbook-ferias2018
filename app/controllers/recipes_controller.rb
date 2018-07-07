class RecipesController < ApplicationController
  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def new
    @recipe = Recipe.new()
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe   
    else
      render 'new'
    end

  end

  def edit
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  def update
    recipe = Recipe.find(params[:id])
    if recipe.update(recipe_params)
      flash[:succes] = 'Cadastro atualizado com sucesso.'
      redirect_to recipe_path(recipe.id)
    else
      flash[:fail] = 'Não foi possivel editar' 
      redirect_to recipe_path(recipe.id) 
    end

  end

  def buscar
    q = params[:q]
    @busca  = Recipe.where(title: q)
    if @busca.empty?
      flash[:error] = 'Não foi encontrado nada'
      redirect_to root_path
    else
      flash[:succes] = 'Foi encontrado'
    end

    
  end

  private

  def recipe_params
   params.require(:recipe).permit(:title, :recipe_type_id, 
   :cuisine_id, :cook_time, :difficulty, :ingredients, :cook_method)
  end

end





