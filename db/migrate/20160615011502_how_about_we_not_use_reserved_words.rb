class HowAboutWeNotUseReservedWords < ActiveRecord::Migration
  def change
  rename_column :products, :name, :product_name
  rename_column :products, :type, :product_type
  end
end
