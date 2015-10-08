module Registrations
  class SellersController < ApplicationController
    layout 'login'

    def new
      @form = SellerSignupForm.new
    end

    def create
      @form = SellerSignupForm.new(sign_up_params)
      if @form.save
        sign_in(@form.user)
        redirect_to root_path, notice: 'You have successfully signed up!'
      else
        render :new
      end
    end

    private

    def sign_up_params
      params.require(:seller).permit(
        :email, :password, :password_confirmation,
        :shop_name, :avatar_image
      )
    end
  end
end
