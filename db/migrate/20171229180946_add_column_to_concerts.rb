class AddColumnToConcerts < ActiveRecord::Migration[5.1]
  def change
    add_column :concerts, :purchased, :boolean
  end
end
