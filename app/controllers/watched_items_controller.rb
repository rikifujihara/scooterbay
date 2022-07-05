class WatchedItemsController < ApplicationController
    def destroy
        # This query was implemented to find the instance of the Listing model with the same :id parameter
        @listing = Listing.find(params[:id])
        # This query finds the instance of the WatchedItem model that references the currently set listing and references the current user as it's user that it belongs to. This retrieves the WatchedItem instance that the current user has made for the set listing.
        @watched_item = WatchedItem.find_by(listing_id: @listing.id, user_id: current_user.id)
        # This query finds the instance of the listing model that the @watched_item belongs to via the 'belongs to' relationship.
        @tmp_listing = @watched_item.listing
        # This query deletes the assigned instance of the WatchedItem model from the database
        @watched_item.destroy
    
        respond_to do |format|
          format.html { redirect_to @tmp_listing, notice: "Item removed from watchlist." }
          format.json { head :no_content }
        end
    end
end
