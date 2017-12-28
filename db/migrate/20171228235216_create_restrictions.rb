class CreateRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :restrictions do |t|
      t.string :body
    end
  end
end
