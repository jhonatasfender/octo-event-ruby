class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :action, :null => false
      t.integer :number, :null => false
      t.string :create_by, :null => false

      t.timestamps
    end
  end
end
