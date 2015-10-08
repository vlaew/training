module Registrations
  class GuestsController < ApplicationController
    layout 'login'

    def new
      @form = GuestSignupForm.new
    end

    def create
      @form = GuestSignupForm.new(sign_up_params)
      if @form.save
        sign_in(@form.user)
        redirect_to root_path, notice: 'You have successfully signed up!'
      else
        render :new
      end
    end

    private

    def sign_up_params
      params.require(:guest).permit(
        :email, :password, :password_confirmation
      )
    end
  end
end
