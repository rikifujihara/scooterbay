class UsersController < ApplicationController
  before_action :authenticate_user!  

  def index
    # This query was implemented to retreive every instance of the User model
    @users = User.all
  end

  def show
    # This query was implemented to find the instance of the User model with the same :id parameter
    @user = User.find(params[:id])
  end

  def edit
    # This query uses devise's current_user helper method to assign the instance of the User model which is currently logged in to the @user variable
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to current_user, notice: 'Profile updated.'}
      else
        format.html { render :edit }
      end
    end
  end

  def delete_image
    image = ActiveStorage::Attachment.find(params[:image_id])
    if current_user == image.record || current_user.admin?
      image.purge
      redirect_back(fallback_location: request.referer)
    else
      redirect_to root_path, notice: "Access denied."
    end
  end

  def destroy
    # This query was implemented to find the instance of the User model with the same :id parameter
    @user = User.find(params[:id])
    # This query destroys the instance of the User model which was just assigned to the @user variable
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Account successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :bio,
      :first_name,
      :avatar,
      :mobile
    )
  end
end
