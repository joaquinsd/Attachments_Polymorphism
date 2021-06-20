class DeleteProductReference < ActiveRecord::Migration[5.2]
  def change
    remove_column :physicals, :product_id
    remove_column :digitals, :product_id
  end
end
