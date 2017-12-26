class AddTermToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :term, :string
  end
end
