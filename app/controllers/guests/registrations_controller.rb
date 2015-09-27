module Guests
  class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
      params.require(:guest).permit(
        user_attributes: [ :email, :password, :password_confirmation ]
      )
    end
  end
end
