class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.boolean :done
      t.string :description
      t.datetime :deadline

      t.timestamps
    end
  end
end
