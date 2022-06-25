module ListingsHelper
    def user_made_offer?
        Offer.find_by(listing_id: @listing.id, offerer_id: current_user.id)
    end
end
