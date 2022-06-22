class OffersController < ApplicationController
  
    def new
        @offer = Offer.new
    end

    # Only allow a list of trusted parameters through.
    def offer_params
    params.require(:offer).permit(:price)
    end
end
  