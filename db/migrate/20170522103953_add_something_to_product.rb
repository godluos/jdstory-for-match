class AddSomethingToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :cg_price, :integer
    add_column :products, :texture, :string
    add_column :products, :introduce, :string
  end
end
