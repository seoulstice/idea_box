class RemoveColumnFromConcerts < ActiveRecord::Migration[5.1]
  def change
    remove_column :concerts, :instruction
  end
end
