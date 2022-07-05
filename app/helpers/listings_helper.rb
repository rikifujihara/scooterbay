module ListingsHelper
    def user_made_offer?
        # This query looks for an instance of the Offer model that references the set listing as well as the current user.
        Offer.find_by(listing_id: @listing.id, offerer_id: current_user.id)
    end

    def item_watched?
        if current_user
        # This query looks for an instance of the WatchedItem model that references the set listing as well as the current user.
        WatchedItem.find_by(listing_id: @listing.id, user_id: current_user.id)
        end
    end

    def format_address(address)
        unwanted = ["id", "listing_id", "created_at", "updated_at"]
        formatted = ""
        address.attributes.each do |key, value|
            unless unwanted.include?(key.to_s)
                if value && value.to_s != ""
                    formatted << "#{value.to_s}, "
                end
            end
        end
        return formatted[0...-2]
    end
end
