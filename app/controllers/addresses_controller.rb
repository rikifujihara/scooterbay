class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy authorize_user ]

  def destroy
    # This query was implemented to find the instance of the Address model with the same :id parameter
    @address = Address.find(params[:id])
    # This query finds the instance of the Listing model that the set @address belongs to
    @tmp_listing = @address.listing
    # This query deletes the set @address from the database
    @address.destroy

    respond_to do |format|
      format.html { redirect_to @tmp_listing, notice: "Address successfully removed." }
      format.json { head :no_content }
    end
  end

  def new
      #This query sets up a new instance of the Address model without saving it.
      @address = Address.new
  end

  def edit
  end

  def update
      respond_to do |format|
        if @address.update(address_params)
          format.html { redirect_to listing_url(@address.listing), notice: "Address was successfully updated." }
          format.json { render :show, status: :ok, location: @address }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
  end

private

  def set_address
      # This query was implemented to find the instance of the Address model with the same :id parameter
      @address = Address.find(params[:id])
  end

  private

  def address_params
    params.require(:address).permit(:listing_id, :postcode, :state, :suburb, :street_name, :street_number)
  end
end
