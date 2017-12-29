class AddDateColumnToConcerts < ActiveRecord::Migration[5.1]
  def change
    add_column :concerts, :date, :datetime
  end
end
