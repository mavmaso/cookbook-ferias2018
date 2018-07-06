require 'rails_helper'

feature 'User edit recipe' do
  scenario 'View Editable' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco
    cuisine = Cuisine.create(name: 'Brasileira')
    Cuisine.create(name: 'Mexicana')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    RecipeType.create(name: 'Janta')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          ingredients: 'Cenoura, acucar, oleo e chocolate',
                          cook_method: 'Misturar tudo, bater e assar',
                          cook_time: 60)
    #Navegacao
    visit root_path
    click_on recipe.title
    click_on 'Editar'
    
    fill_in  'Título', with: 'Churros'
    select 'Janta', from: 'Tipo da Receita' 
    select 'Mexicana', from: 'Cozinha'
    fill_in 'Dificuldade', with: 'Facil' 
    fill_in 'Tempo de Preparo', with: '90'
    fill_in 'Ingredientes', with: 'Doce de leite'
    fill_in 'Como Preparar', with: 'Ir na vila do Chaves'
    click_on 'Atualizar'
    
    #expectativas

    expect(page).to have_css('h1', text: 'Cadastro atualizado com sucesso.')
    expect(page).to have_css('h1', text: 'Churros')
    expect(page).to have_css('li', text: 'Janta')
    expect(page).to have_css('li', text: 'Mexicana')
    expect(page).to have_css('li', text: 'Facil')
    expect(page).to have_css('li', text: '90 minutos')
    expect(page).to have_css('li', text: 'Doce de leite')
    expect(page).to have_css('li', text: 'Ir na vila do Chaves')

  end
  
  #scenario 'Change cook time' do
    #criar
    #cuisine = Cuisine.create(name: 'Brasileira')
    #recipe_type = RecipeType.create(name: 'Sobremesa')
    #recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          #cuisine: cuisine, difficulty: 'Médio',
                          #ingredients: 'Cenoura, acucar, oleo e chocolate',
                          #cook_method: 'Misturar tudo, bater e assar',
                          #cook_time: 60)
    #navegacao

    #expectativa

  #end




end