class WatchedItemsController < ApplicationController
    def destroy
        @watched_item = Watched_item.find(params[:id])
        @tmp_listing = @watched_item.listing
        @watched_item.destroy
    
        respond_to do |format|
          format.html { redirect_to @tmp_listing, notice: "watched_item successfully removed." }
          format.json { head :no_content }
        end
    end
end
