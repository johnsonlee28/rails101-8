class CreateGrouprelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :grouprelationships do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
