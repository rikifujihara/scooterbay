class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy authorize_user place_order place_offer specify_address watch_item]
  before_action :set_offer, only: %i[ show ]
  before_action :set_form_vars, only: %i[ new edit update create ]
  before_action :authenticate_user!, except: %i[ index show offroad commuter kids highspeed search]
  before_action :authorize_user, only: %i[ edit update destroy ]

  # GET /listings or /listings.json
  def index
    # This query was implemented to retreive every instance of the Listing model
    @listings = Listing.all
  end
  
  def offroad
    # This query was implemented to retreive every instance of the Listing model where the listing's foreign key, "category id" is 1. The referenced category instance is the 'offroad' category.
    @listings = Listing.where(category_id: 1)
  end
  
  def highspeed
    # This query was implemented to retreive every instance of the Listing model where the listing's foreign key, "category id" is 2. The referenced category instance is the 'highspeed' category.
    @listings = Listing.where(category_id: 2)
  end
  
  def commuter
    # This query was implemented to retreive every instance of the Listing model where the listing's foreign key, "category id" is 3. The referenced category instance is the 'commuter' category.   
    @listings = Listing.where(category_id: 3)
  end
  
  def kids
    # This query was implemented to retreive every instance of the Listing model where the listing's foreign key, "category id" is 4. The referenced category instance is the 'kids' category.
    @listings = Listing.where(category_id: 4)
  end
  
  def watchlist
    # This query finds each instance of the WatchedItem model where it's foreign key, "user_id" is the same as the id of the current user. Each watcheditem instance references a listing and a user, so by retrieving the watched items where the user_id is the current user's, all items that the current user is watching are retrieved.
    @watchlist = WatchedItem.where(user_id: current_user.id)
  end

  def search
    @listings = []
    #Here each instance of the Address model is retrieved where the search parameter is included in it's postcode attribute.
    @addresses = Address.where("postcode LIKE ?", "%" + params[:q] + "%")
    @addresses.each do |address|
      @listings << address.listing
    end
  end
  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    #This query sets up a new instance of the Listing model without saving it.
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    #This query sets up a new Listing without saving it, with the permitted parameters as its attributes.
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    # This query destroys the instance of the User model which was just assigned to the @user variable
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def place_offer

    # This query creates a new instance of the Offer model and assigns the following attributes.
    Offer.create(
    # The id of the specified @listing is retrieved and assigned as the new Offer instance's referenced listing_id
    listing_id: @listing.id,
    # The user_id of the specified @listing is retrieved and assigned as the new Offer instance's referenced merchant_id
    merchant_id: @listing.user_id,
    # The user_id of the current user is retrieved and assigned as the new Offer instance's referenced offerer_id
    offerer_id: current_user.id
    )
    flash[:notice] = "Offer created! Enter the offer amount or delete offer to cancel."
    # This query first retrieves the last (therefore most recent) of the instances of the Offer model that belong to the current_user User instance as offers_out, which retrieves the offer that the user just created.
    redirect_to edit_offer_path(current_user.offers_out.last)
  end

  def specify_address
    # This query creates a new instance of the Address model and assigns the current listing's id as it's referenced listing foreign key attribute.
    Address.create(
    listing_id: @listing.id
    )
    flash[:notice] = "Please specify the address of your listing."
    # This query selects the has_one address instance that is attached to the current listing.
    redirect_to edit_address_path(@listing.address)
  end

  def watch_item
    # This query creates a new instance of the Offer model and assigns the following attributes.
    WatchedItem.create(
    # The id of the specified @listing is retrieved and assigned as the new WatchedItem instance's referenced listing_id
    listing_id: @listing.id,
    # The id of the current_user is retrieved and assigned as the new WatchedItem instance's referenced user_id
    user_id: current_user.id
    )
    flash[:notice] = "Listing added to watchlist"
    redirect_to @listing
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      # This query was implemented to find the instance of the Listing model with the same :id parameter
      @listing = Listing.find(params[:id])
    end
   
    def set_offer
      if current_user
      # This query finds the instance of the Offer model that references the currently set listing and references the current user as it's offerer. This retrieves the Offer instance that the current user has made.
      @offer = Offer.find_by(listing_id: @listing.id, offerer_id: current_user.id)
      end
    end

    def authorize_user
      # This query finds the set listing's referenced user model instance which it belongs to.
      if !current_user.admin && @listing.user != current_user
        flash[:alert] = "Access denied"
        redirect_to listings_path
      end
    end

    def set_form_vars
      #This query retrieves every instance of the Category model.
      @categories = Category.all
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :brand, :price, :description, :sold, :in_built_lighting, :double_motor, :pneumatic_tires, :has_suspension, :user_id, :picture, :category_id)
    end
end
