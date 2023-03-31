class ProfilesController < ApplicationController
  before_action :set_profile
  
  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: "Profile Updated Successfully"
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :date_of_birth, :mobile_number, :city, :state, :country, :gender)
  end
end
