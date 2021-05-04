class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    # EN TODOS LOS CASOS:
   # Agrego .order('submit_date DESC') para que devuelva los objetos ordenados con los más nuevos primero

   if params[:category] # Si viene el parámetro de category_id, devuelvo las recetas de la categoría
     @recipes = Recipe.where(category_id: params[:category]).order('submit_date DESC')
   elsif params[:search] # Si viene el parámetro de search, lo utilizo para realizar la búsqueda
     # Pongo los el parámetro entre % % para poder buscar con comodines, en caso que no venga el nombre completo.
     @recipes = Recipe.where("name LIKE ?", "%#{params[:search]}%").order('submit_date DESC')
   else # Si no llega ningún parámetro en la url, entonces devuelve el listado completo de recetas.
     @recipes = Recipe.all.order('submit_date DESC')
   end
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :featured, :ingredients, :steps, :submit_date, :image_url, :category_id, :recipe_type_id, :author_id)
    end
end
