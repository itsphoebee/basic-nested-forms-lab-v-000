class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'name_1')
    @recipe.ingredients.build(name: 'name_2')
    @recipe.save
  end

  def create
    @recipe = Recipe.new(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes:[
      :name_1,
      :name_2,
      :quantity
      ])
  end

end
