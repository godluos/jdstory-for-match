class ApplicationController < ActionController::Base
  before_action :sign_up_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  helper_method :current_cart


  def admin_required
    if !current_user.admin?
      redirect_to root_path, flash[:alert] = "你不是管理员"
    end
  end

  def current_cart
    @current_cart ||= find_cart
  end

  protected

  def sign_up_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:username]
    devise_parameter_sanitizer.permit :account_update, keys: [:username]
 end


  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end

end
