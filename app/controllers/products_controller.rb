class ProductsController < ApplicationController
  def index
    if params[:category].blank?
    @products = Product.all
  else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id).recent
  end
  end

  def show
    @suggests = Product.all.random6
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功将#{@product.title}加入购物车"
    else
      flash[:warning] = "购物车内已有该商品"
    end
    redirect_to :back
  end

end
