class HomeController < ApplicationController
  def index
    redirect_to products_path
  end
end
