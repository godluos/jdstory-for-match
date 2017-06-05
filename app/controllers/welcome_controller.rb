class WelcomeController < ApplicationController
  layout "welcome"

  def index
    @products = Product.all.random12
  end
end
