class AddUrgencyToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :urgency, :integer
  end
end
