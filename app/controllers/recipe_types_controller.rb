class RecipeTypesController < ApplicationController
  before_action :set_recipe_type, only: %i[ show edit update destroy ]

  # GET /recipe_types or /recipe_types.json
  def index
    @recipe_types = RecipeType.all
  end

  # GET /recipe_types/1 or /recipe_types/1.json
  def show
  end

  # GET /recipe_types/new
  def new
    @recipe_type = RecipeType.new
  end

  # GET /recipe_types/1/edit
  def edit
  end

  # POST /recipe_types or /recipe_types.json
  def create
    @recipe_type = RecipeType.new(recipe_type_params)

    respond_to do |format|
      if @recipe_type.save
        format.html { redirect_to @recipe_type, notice: "Recipe type was successfully created." }
        format.json { render :show, status: :created, location: @recipe_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_types/1 or /recipe_types/1.json
  def update
    respond_to do |format|
      if @recipe_type.update(recipe_type_params)
        format.html { redirect_to @recipe_type, notice: "Recipe type was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_types/1 or /recipe_types/1.json
  def destroy
    @recipe_type.destroy
    respond_to do |format|
      format.html { redirect_to recipe_types_url, notice: "Recipe type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_type
      @recipe_type = RecipeType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_type_params
      params.require(:recipe_type).permit(:name, :description)
    end
end
