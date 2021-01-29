class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :username
      t.timestamps
    end
  end
end
