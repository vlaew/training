module Sellers
  class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
      params.require(:seller).permit(
        :shop_name, :avatar_image,
        user_attributes: [ :email, :password, :password_confirmation ]
      )
    end
  end
end
