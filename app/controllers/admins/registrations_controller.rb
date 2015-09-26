module Admins
  class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
      params.require(:admin).permit(
        :first_name, :last_name,
        user_attributes: [ :email, :password, :password_confirmation ]
      )
    end
  end
end
