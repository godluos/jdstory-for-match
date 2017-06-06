class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:join, :quit]

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

  def join
    @product = Product.find(params[:id])
    if !current_user.is_member_of?(@product)
      current_user.join!(@product)
      flash[:notice] = "加入本讨论版成功！"
    else
      flash[:warning] = "你已经是本讨论版成员了！"
    end
     redirect_to product_path(@product)
   end

   def quit
     @product = Product.find(params[:id])
     if current_user.is_member_of?(@product)
       current_user.quit!(@product)
       flash[:alert] = "已退出本讨论版！"
     else
       flash[:warning] = "你不是本讨论版成员，怎么退出 XD"
     end
     redirect_to product_path(@product)
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
