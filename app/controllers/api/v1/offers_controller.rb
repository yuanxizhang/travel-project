class Api::V1::OffersController < ApplicationController
	before_action :find_offer, only: [:update]

  def index
    @offers = Offer.all
    render json: {status: 'SUCCESS', message: 'Loaded all offers', data: offers}, status: :ok
  end

  def new 
    @offer = Offer.new
  end

  def show  
    render json: @offer
  end

  def create
    @offer = Offer.new(offer_params)
    
    if @offer.valid?
      @offer.save
      render json: @offer, status: :accepted
    else 
      render json: { errors: @offer.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @offer.update(offer_params)
    if @offer.save
      render json: @offer, status: :accepted
    else
      render json: { errors: @offer.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def offer_params
    params.permit(:tour_name, :about, :departs, :length, :price)
  end

  def find_offer
    @offer = Offer.find(params[:id])
  end
end
