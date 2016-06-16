module ProductsHelper

  def products_for_select
    Product.where(status: 'active').collect { |m| [m.product_name, m.id] }
  end
end
