class AddDescriptionToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :description, :text
  end
end
