class OffersController < ApplicationController
    before_action :set_offer, only: %i[ show edit update destroy authorize_user]
    before_action :authorize_user, only: %i[ edit update destroy show ]
    before_action :authenticate_user!
   
    def index
        # This query was implemented to retreive every instance of the Offer model
        @offers = Offer.all
    end
   
    def show
    end

    def offers_in
        #This query retrieves offers that belong to current user via the offers_in / merchant id reference, which retrieves the offer instances where the current user's id is the merchant_id.
        @offers_in = current_user.offers_in
    end

    def offers_out
        #This query retrieves offers that belong to current user via the offers_out / offerer id reference, which retrieves the offer instances where the current user's id is the offerer_id.
        @offers_out = current_user.offers_out
    end
  
    def destroy
      # This query was implemented to find the instance of the Offer model with the same :id parameter
      @offer = Offer.find(params[:id])
      # This query finds the instance of the listing model that the @offer belongs to via the 'belongs to' relationship.
      @tmp_listing = @offer.listing
      # This query deletes the assigned instance of the Offer model from the database
      @offer.destroy
  
      respond_to do |format|
        format.html { redirect_to @tmp_listing, notice: "Offer successfully removed." }
        format.json { head :no_content }
      end
    end

    def new
        #This query sets up a new Offer without saving it
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
      # current_user.admin retrieves the boolean attribute of User instance 'admin'
      if !current_user.admin && (current_user != @offer.merchant && current_user != @offer.offerer)
        flash[:alert] = "Access denied"
        redirect_to listings_path
      end
    end

    def set_offer
      # This query was implemented to find the instance of the Offer model with the same :id parameter
        @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
    params.require(:offer).permit(:price, :message)
    end
end
  