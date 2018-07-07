require 'rails_helper'

feature 'User search for recipe' do
  scenario 'search and find' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco.
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           ingredients: 'Cenoura, acucar, oleo e chocolate',
                           cook_method: 'Misturar tudo, bater e assar',
                           cook_time: 60)
    #Navegaçao
    visit root_path
    fill_in 'Busca', with: 'Bolo de cenoura'
    click_on 'Buscar'

    #expectativas
    expect(page).to have_css('h1', text: 'Foi encontrado')
    expect(page).to have_css('h1', text: 'Bolo de cenoura')
    expect(page).to have_css('p', text: 'Sobremesa')
    expect(page).to have_css('p', text: 'Brasileira')
    expect(page).to have_css('p', text: 'Médio')
    expect(page).to have_css('p', text: '60 minutos')
    expect(page).to have_css('p', text: 'Cenoura, acucar, oleo e chocolate')
    expect(page).to have_css('p', text: 'Misturar tudo, bater e assar')


  end

  scenario 'search not found' do
    #Criar dados
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           ingredients: 'Cenoura, acucar, oleo e chocolate',
                           cook_method: 'Misturar tudo, bater e assar',
                           cook_time: 60)
    #Navegaçao
    visit root_path
    fill_in 'Busca', with: 'Biscoito'
    click_on 'Buscar'
    
    #expectativa
    expect(page).to have_css('h1', text: 'Não foi encontrado nada')

  end

end
