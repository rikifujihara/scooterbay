module ListingsHelper
    def user_made_offer?
        Offer.find_by(listing_id: @listing.id, offerer_id: current_user.id)
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
