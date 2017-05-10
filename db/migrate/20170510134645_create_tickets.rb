class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :movie_id, :index => true
      t.string :cinema_name
      t.integer :quantity
      t.string :location
      t.timestamps
    end
  end
end
