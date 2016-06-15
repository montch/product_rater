class AddSourceToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :source_id, :integer
  end
end
