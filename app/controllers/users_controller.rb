class UsersController < ApplicationController
  before_action :authenticate_user!  

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
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
    @user = User.find(params[:id])
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
