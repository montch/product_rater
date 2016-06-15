# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  product_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_type :string
#

class Product < ActiveRecord::Base
  has_many :ratings
end
