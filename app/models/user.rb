class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :product_relationships
  has_many :participated_products, through: :product_relationships, source: :product
  has_many :orders



  def admin?
    is_admin
  end

  def is_member_of?(product)
      participated_products.include?(product)
    end

end
