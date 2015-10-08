module Registrations
  class AdminsController < ApplicationController
    layout 'login'

    def new
      @form = AdminSignupForm.new
    end

    def create
      @form = AdminSignupForm.new(sign_up_params)
      if @form.save
        sign_in(@form.user)
        redirect_to root_path, notice: 'You have successfully signed up!'
      else
        render :new
      end
    end

    private

    def sign_up_params
      params.require(:admin).permit(
        :email, :password, :password_confirmation,
        :first_name, :last_name, :birthdate,
        :avatar_image, :passport_image
      )
    end
  end
end
