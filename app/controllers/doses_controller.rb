class DosesController < ApplicationController
  before_action :set_cocktail, except: :destroy

  def new
    @dose = @cocktail.doses.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
  if @dose.save
    redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully created.'
  else
    render :new
    end
  end

  # /DOSES/ID
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

   def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end


  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
