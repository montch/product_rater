module ProductsHelper

  def products_for_select
    Product.all.collect { |m| [m.product_name, m.id] }
  end
end
