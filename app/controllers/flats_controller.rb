class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.image_url = "https://source.unsplash.com/random/?interior"

    if @flat.save
      redirect_to @flat, notice: "Flat #{@flat.name} was created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: "Flat #{@flat.name} was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_url, notice: "Flat #{@flat.name} was destroyed."
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  # Sanitized parameters
  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

end
