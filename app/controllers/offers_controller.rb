class OffersController < ApplicationController
    before_action :set_offer, only: %i[ show edit update destroy authorize_user]
    before_action :authorize_user, only: %i[ edit update destroy show ]
    before_action :authenticate_user!
   
    def index
        @offers = Offer.all
    end
   
    def show
    end

    def offers_in
        @offers_in = current_user.offers_in
    end

    def offers_out
        @offers_out = current_user.offers_out
    end
  
    def destroy
      @offer = Offer.find(params[:id])
      @offer.destroy
  
      respond_to do |format|
        format.html { redirect_to user_path(current_user), notice: "Offer successfully removed." }
        format.json { head :no_content }
      end
    end

    def new
        @offer = Offer.new
    end

    def edit
    end

    def update
        respond_to do |format|
          if @offer.update(offer_params)
            format.html { redirect_to offer_url(@offer), notice: "Offer was successfully updated." }
            format.json { render :show, status: :ok, location: @offer }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @offer.errors, status: :unprocessable_entity }
          end
        end
    end

  private

    def authorize_user
      if !current_user.admin && (current_user != @offer.merchant && current_user != @offer.offerer)
        flash[:alert] = "Access denied"
        redirect_to listings_path
      end
    end

    def set_offer
        @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
    params.require(:offer).permit(:price)
    end
end
  