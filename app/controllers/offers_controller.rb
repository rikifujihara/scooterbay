class OffersController < ApplicationController
    before_action :set_offer, only: %i[ show edit update destroy ]
   
    def index
        @offers = Offer.all
    end
    def new
        @offer = Offer.new
    end

    def edit
    end

  private

    def set_offer
        @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
    params.require(:offer).permit(:price)
    end
end
  