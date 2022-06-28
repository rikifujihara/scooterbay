class WatchedItemsController < ApplicationController
    def destroy
        @listing = Listing.find(params[:id])
        @watched_item = WatchedItem.find_by(listing_id: @listing.id, user_id: current_user.id)
        @tmp_listing = @watched_item.listing
        @watched_item.destroy
    
        respond_to do |format|
          format.html { redirect_to @tmp_listing, notice: "Item removed from watchlist." }
          format.json { head :no_content }
        end
    end
end
