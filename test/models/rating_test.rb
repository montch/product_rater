# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  score      :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
