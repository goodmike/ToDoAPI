class CreateTodo < ActiveRecord::Migration
  def change
      create_table :todos, id: :uuid do |t|
          t.string :value
          t.boolean :completed
          t.timestamps
      end
  end
end
