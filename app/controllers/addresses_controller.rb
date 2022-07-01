class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy authorize_user ]

  def destroy
    @address = Address.find(params[:id])
    @tmp_listing = @address.listing
    @address.destroy

    respond_to do |format|
      format.html { redirect_to @tmp_listing, notice: "Address successfully removed." }
      format.json { head :no_content }
    end
  end

  def new
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

  # def authorize_user
  #   if !current_user.admin && (current_user != @offer.merchant && current_user != @offer.offerer)
  #     flash[:alert] = "Access denied"
  #     redirect_to listings_path
  #   end
  # end

  def set_address
      @address = Address.find(params[:id])
  end

  private

  def address_params
    params.require(:address).permit(:listing_id, :postcode, :state, :suburb, :street_name, :street_number)
  end
end
