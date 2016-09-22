class RegistrationsController < Devise::RegistrationsController

  private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :image)
    end

    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :username, :image)
    end

    protected

   def after_update_path_for(resource)
     user_path(resource)
   end
  end
