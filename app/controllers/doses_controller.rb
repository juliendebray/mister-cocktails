class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]
  def new
    @dose = @cocktail.doses.new
    @ingredients = Ingredient.all.map {|i| [i.name, i.id]}
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    Dose.find(params[:id]).destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end


  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :amount)
  end
end
