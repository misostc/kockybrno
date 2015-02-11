class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :prefix_title, :suffix_title, :first_name, :last_name, :species, :location, :website)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :prefix_title, :suffix_title, :first_name, :last_name, :species, :location, :website)
  end
end
