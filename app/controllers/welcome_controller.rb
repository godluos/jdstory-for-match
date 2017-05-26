class WelcomeController < ApplicationController
  layout "welcome"

  def index
    @products = Product.all
  end
end
