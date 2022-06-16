json.extract! listing, :id, :title, :brand, :price, :description, :sold, :in_built_lighting, :double_motor, :pneumatic_tires, :has_suspension, :user_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
