# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  score      :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  source_id  :integer
#

class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :source
  validates_presence_of :score

  SCORES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

end
